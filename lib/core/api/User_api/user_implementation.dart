import 'package:pretevest/core/api/User_api/user_api.dart';
import 'package:pretevest/core/api/data_models/auth_response/loginresponse.dart';
import 'package:pretevest/core/api/data_models/auth_response/registerEmailOTPResponse.dart';
import 'package:pretevest/core/api/data_models/user_response/foundWalletModel.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllLoanRequestModel.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/myBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/myLoanRequestModel.dart';
import 'package:pretevest/core/api/data_models/user_response/pledgeLoanModel.dart';
import 'package:pretevest/core/api/data_models/user_response/resolvedBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/userResponseModel.dart';
import 'package:pretevest/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../data_models/api_response.dart';

import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

class UserApiImplementation implements UserApi  {

  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };
  // Map<String, String> get authHeader => {
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Token ${getToken()}',
  //     };

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

  @override
  Future<FoundWalletResponse> foundWallet({String? amount}) async {
    Map val = {
      "amount": amount,
    };
   SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody =
        await server.post(ApiRoutes.foundWallet, {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      }, jsonEncode(val));
    FoundWalletResponse response = foundWalletResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<List<GetAllBankModel>> getAllBank() async {
     SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody = await server.get(
      ApiRoutes.getALlBanks,
      {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      },
    );
    List<GetAllBankModel> response = getAllBankModelFromJson(responsebody);
    return response;
  }

  @override
  Future<GetAllLoanRequestModel> getAllLoanRequest() async {
     SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody = await server.get(
      ApiRoutes.getAllLoanRequest,
      {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      },
    );
    GetAllLoanRequestModel response =
        getAllLoanRequestModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> pledgeToALoan(int Owner, double amount) async {
    Map val = {
      "amount": amount,
    };
     SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody = await server.post(
        "https://pretevest.herokuapp.com/api/v1/loans/pledge/$Owner",
        {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      },
        jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> updateUserInfo(
      {String? education,
      String? city,
      String? state,
      String? gender,
      DateTime? dob,
      String? profession,
      String? businessname,
      String? businessphone,
      String? businessaddress}) async {
    Map val = {
      "education ": education,
      "city": city,
      "state": state,
      "gender": gender,
      "dob": dob,
      "profession": profession,
      "businessname": businessname,
      "businessphone": businessphone,
      "businessaddress": businessaddress
    };
     SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody = await server.post(
        ApiRoutes.updateUserData, {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      }, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ResolveBankModel> resolvedBank(
      {String? accountNumber, String? bankCode}) async {
    Map val = {
      "account_number": accountNumber,
      "bank_code": bankCode,
    };
   SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody =
        await server.post(ApiRoutes.resolvedBank, {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      }, jsonEncode(val));
    ResolveBankModel response = resolveBankModelFromJson(responsebody);
    return response;
  }
  
  @override
  Future<ApiResponse> saveBank({String? bankName, String? bankCode, String? accountNumber, String? accountName}) async{
    Map val = {
    "bank_name" : bankName,
    "bank_code" : bankCode,
    "acc_num" : accountNumber,
    "acc_name" : accountName,
};
   SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody =
        await server.post(ApiRoutes.resolvedBank, {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      }, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<List<MyBankModel>> getBank() async{
  
     SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody = await server.get(
       ApiRoutes.myBank,
        {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      },
    );
    List<MyBankModel>response = myBankModelFromJson(responsebody);
    return response;
  }

  @override
  Future <MyPledgedModel> getPledgedLoan() async {
     SharedPreferences preference = await SharedPreferences.getInstance();
    String token = preference.getString('token') ?? '';
    var responsebody = await server.get(
       ApiRoutes.pledgedLoan,
        {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token}',
      },
    );
    MyPledgedModel response = myPledgedModelFromJson(responsebody);
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

