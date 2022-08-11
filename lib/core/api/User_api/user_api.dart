import 'package:dio/dio.dart';
import 'package:pretevest/core/api/data_models/api_response.dart';
import 'package:pretevest/core/api/data_models/auth_response/loginresponse.dart';
import 'package:pretevest/core/api/data_models/auth_response/registerEmailOTPResponse.dart';
import 'package:pretevest/core/api/data_models/user_response/foundWalletModel.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllLoanRequestModel.dart';
import 'package:pretevest/core/api/data_models/user_response/myBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/myLoanRequestModel.dart';
import 'package:pretevest/core/api/data_models/user_response/pledgeLoanModel.dart';
import 'package:pretevest/core/api/data_models/user_response/resolvedBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/userResponseModel.dart';

abstract class UserApi {
  Future<UserResponse> getUserData();
  Future<ApiResponse> makeLoanRequest(
      {String amount, String title, String description});
  Future<MyLoanRequest> getLoanRequest();
  Future<FoundWalletResponse> foundWallet({String amount});
  Future<GetAllLoanRequestModel> getAllLoanRequest();
  Future<ApiResponse> pledgeToALoan(int Owner, double amount);
  Future<List<GetAllBankModel>> getAllBank();
  Future<List<MyBankModel>> getBank();
  Future<MyPledgedModel> getPledgedLoan();


  
  Future<ResolveBankModel> resolvedBank({String accountNumber, String bankCode});
  Future<ApiResponse> updateUserInfo({
    String education,
    String city,
    String state,
    String gender,
    DateTime dob,
    String profession,
    String businessname,
    String businessphone,
    String businessaddress,
  });
   Future<ApiResponse> saveBank({
    String bankName,
    String bankCode,
    String accountNumber,
    String accountName,
  });
}
