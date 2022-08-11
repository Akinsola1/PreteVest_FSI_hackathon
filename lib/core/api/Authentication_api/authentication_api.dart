import 'package:dio/dio.dart';
import 'package:pretevest/core/api/data_models/api_response.dart';
import 'package:pretevest/core/api/data_models/auth_response/loginresponse.dart';
import 'package:pretevest/core/api/data_models/auth_response/registerEmailOTPResponse.dart';

abstract class AuthenticationApi {
  Future<ApiResponse> sendOtp({String emailAddress});


  Future<RegisterEmailOtp> registerEmail({
    String emailAddress,
    String password,
    String OTP,
  });


  Future<ApiResponse> setPersonalInfo(
      {String firstname, String lastname, String phone, String address});

  Future<LoginResponse> login({String emailAddress, String password});

}
