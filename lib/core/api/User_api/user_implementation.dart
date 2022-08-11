import 'package:pretevest/core/api/User_api/user_api.dart';
import 'package:pretevest/core/api/data_models/auth_response/loginresponse.dart';
import 'package:pretevest/core/api/data_models/auth_response/registerEmailOTPResponse.dart';
import 'package:pretevest/core/api/data_models/user_response/myLoanRequest.dart';
import 'package:pretevest/core/api/data_models/user_response/userResponse.dart';
import 'package:pretevest/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../data_models/api_response.dart';

import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

class UserApiImplementation implements UserApi {
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

  // @override
  // Future<ApiResponse> sendOtp({String? emailAddress}) async {
  // Map val = {
  //   "email": emailAddress,
  // };
  // var responsebody =
  //     await server.post(ApiRoutes.sendEmailOtp, header, jsonEncode(val));
  // ApiResponse response = ApiResponse.fromJson(responsebody);
  // return response;
  // }

  @override
  Future<UserResponse> getUserData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody = await server.get(ApiRoutes.getUserData, {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Token ${token}',
    });
    UserResponse response = userResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<MyLoanRequest> getLoanRequest() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody = await server.get(ApiRoutes.getLoanRequest, {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Token ${token}',
    });
    MyLoanRequest response = myLoanRequestFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> makeLoanRequest(
      {String? amount, String? title, String? description}) async {
    Map val = {
      "amount": amount,
      "title": title,
      "desc": description,
    };
     SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody =
        await server.post(ApiRoutes.requestLoan, {
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

