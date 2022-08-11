import 'package:dio/dio.dart';
import 'package:pretevest/core/api/data_models/api_response.dart';
import 'package:pretevest/core/api/data_models/auth_response/loginresponse.dart';
import 'package:pretevest/core/api/data_models/auth_response/registerEmailOTPResponse.dart';
import 'package:pretevest/core/api/data_models/user_response/foundWalletModel.dart';
import 'package:pretevest/core/api/data_models/user_response/myLoanRequestModel.dart';
import 'package:pretevest/core/api/data_models/user_response/userResponseModel.dart';

abstract class UserApi {
  Future<UserResponse> getUserData();
  Future <ApiResponse> makeLoanRequest({String amount, String title, String description});
  Future <MyLoanRequest> getLoanRequest();
  Future <FoundWalletResponse> foundWallet({String amount});
}
