import 'package:pretevest/core/api/data_models/auth_response/loginresponse.dart';
import 'package:pretevest/core/api/data_models/auth_response/registerEmailOTPResponse.dart';
import 'package:pretevest/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../data_models/api_response.dart';

import 'authentication_api.dart';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

class AuthenticationApiImpl implements AuthenticationApi {
  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Map<String, String> get mediaHeader => {
        'Accept': 'application/json',
        // 'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  var server = locator<API>();

  @override
  Future<ApiResponse> sendOtp({String? emailAddress}) async {
    Map val = {
      "email": emailAddress,
    };
    var responsebody =
        await server.post(ApiRoutes.sendEmailOtp, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<LoginResponse> login({String? emailAddress, String? password}) async {
    Map val = {
      "email": emailAddress,
      "password": password,
    };
    var responsebody =
        await server.post(ApiRoutes.login, header, jsonEncode(val));
    LoginResponse response = loginResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<RegisterEmailOtp> registerEmail(
      {String? emailAddress, String? password, String? OTP}) async {
    Map val = {
      "email": emailAddress,
      "password": password,
      "code": OTP,
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    var responsebody = await server.post(
        ApiRoutes.registerEmailOTP,
        header,
        jsonEncode(val));

    RegisterEmailOtp response = registerEmailOtpFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> setPersonalInfo(
      {String? firstname,
      String? lastname,
      String? phone,
      String? address}) async {
    Map val = {
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
      "address": address
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    var responsebody =
        await server.post(ApiRoutes.setPersonalInfo, {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Token ${token}',
        }, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }
}

// String? first_name,
//     String? last_name,
//     String? email,
//     String? password,
//     String? category,
//     String? phoneNumber,
//     String? city,
//     String? state,
//     String? pharmacy,

