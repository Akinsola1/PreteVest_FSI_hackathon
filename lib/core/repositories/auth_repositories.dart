import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretevest/core/api/Authentication_api/authentication_api.dart';
import 'package:pretevest/core/api/api_utils/network_exception.dart';
import 'package:pretevest/core/api/data_models/api_response.dart';
import 'package:pretevest/core/api/data_models/auth_response/loginresponse.dart';
import 'package:pretevest/core/api/data_models/auth_response/registerEmailOTPResponse.dart';
import 'package:pretevest/core/mixin/validator.dart';

import 'package:pretevest/locator.dart';
import 'package:pretevest/ui/responsive_state.dart/base_view_model.dart';
import 'package:pretevest/ui/responsive_state.dart/view_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends BaseNotifier with Validators {
  var authApi = locator<AuthenticationApi>();

  Future<bool> sendOtp(String email) async {
    setState(ViewState.Busy);

    try {
      await authApi.sendOtp(
        emailAddress: email,
      );
      setState(ViewState.Idle);

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("token", res.data!.token!);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> registerEmailOtp(
      String email, String password, String code) async {
    setState(ViewState.Busy);

    try {
      RegisterEmailOtp response = await authApi.registerEmail(
          emailAddress: email, password: password, OTP: code);
      setState(ViewState.Idle);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", response.data!.token!);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> setPersonalInfo(
      String firstName, String lastname, String phone, String address) async {
    setState(ViewState.Busy);

    try {
      await authApi.setPersonalInfo(
        firstname: firstName,
        lastname: lastname,
        phone: phone,
        address: address,
      );
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> login(String email, String password) async {
    setState(ViewState.Busy);

    try {
      LoginResponse response = await authApi.login(
        emailAddress: email,
        password: password,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", response.data!.token!);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }

  SnackbarController displayError(
      {required String error, required String message}) {
    SnackbarController controller = Get.snackbar(
      error,
      message,
      maxWidth: 300,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.5),
    );
    return controller;
  }
}
