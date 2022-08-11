import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretevest/core/api/User_api/user_api.dart';
import 'package:pretevest/core/api/data_models/user_response/foundWalletModel.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllLoanRequestModel.dart';
import 'package:pretevest/core/api/data_models/user_response/myBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/myLoanRequestModel.dart';
import 'package:pretevest/core/api/data_models/user_response/pledgeLoanModel.dart';
import 'package:pretevest/core/api/data_models/user_response/resolvedBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/userResponseModel.dart';

import '../../locator.dart';
import '../../ui/responsive_state.dart/base_view_model.dart';
import '../../ui/responsive_state.dart/view_state.dart';
import '../api/Authentication_api/authentication_api.dart';
import '../api/api_utils/network_exception.dart';
import '../mixin/validator.dart';

class UserProvider extends BaseNotifier with Validators {
  var userApi = locator<UserApi>();
  UserResponse userData = UserResponse();
  MyLoanRequest loanRequest = MyLoanRequest();
  GetAllLoanRequestModel allLoanRequest = GetAllLoanRequestModel();
  FoundWalletResponse foundWalletResponse = FoundWalletResponse();
  MyPledgedModel pledgedLoan = MyPledgedModel();

  List<GetAllBankModel> bankList = [];
  List<MyBankModel> myBankList = [];

  ResolveBankModel resolvedBankDetails = ResolveBankModel();


  Future<bool> getUserData() async {
    setState(ViewState.Busy);

    try {
      userData = await userApi.getUserData();
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


  Future<bool> foundWallet(String amount) async {
    setState(ViewState.Busy);

    try {
     foundWalletResponse =   await userApi.foundWallet(amount: amount);
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
  Future<bool> getLoanRequest() async {
    setState(ViewState.Busy);

    try {
      loanRequest = await userApi.getLoanRequest();
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

  Future<bool> makeLoanRequest(
      String amount, String title, String description) async {
    setState(ViewState.Busy);

    try {
      await userApi.makeLoanRequest(
          amount: amount, title: title, description: description);
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

  Future<bool> getAllLoanRequest(
      ) async {
    setState(ViewState.Busy);

    try {
     allLoanRequest =  await userApi.getAllLoanRequest();
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


   Future<bool> pledgeToALaon(
    double amount, int owner,
      ) async {
    setState(ViewState.Busy);

    try {
      await userApi.pledgeToALoan(owner, amount);
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

  Future<bool> getAllBank() async {
    setState(ViewState.Busy);

    try {
     bankList =  await userApi.getAllBank();
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

  Future<bool> resolvedBank(String accountNumber, String bankCode) async {
    setState(ViewState.Busy);

    try {
     resolvedBankDetails =  await userApi.resolvedBank(accountNumber:accountNumber, bankCode: bankCode );
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

   Future<bool> getMyBank() async {
    setState(ViewState.Busy);

    try {
     myBankList =  await userApi.getBank();
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

     Future<bool> getpledgedLoan() async {
    setState(ViewState.Busy);

    try {
     pledgedLoan =  await userApi.getPledgedLoan();
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
