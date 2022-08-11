class ApiRoutes {
  //base route
  static const String base = 'https://pretevest.herokuapp.com/api/v1';

  //AUthentication
  static const String sendEmailOtp = '$base/otp';
  static const String registerEmailOTP = '$base/register';
  static const String setPersonalInfo = '$base/profile/basic-info';
  static const String login = '$base/login';
  // user
  static const String getUserData = '$base/profile';
  // wallet
  static const String fundWallet = '$base/charge/card';
  // request Loan
  static const String requestLoan = '$base/loans/request';
  static const String getLoanRequest = '$base/loans/my-requests';
}
