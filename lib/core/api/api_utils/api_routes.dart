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
  static const String updateUserData = '$base/profile/update';

  // wallet
  static const String fundWallet = '$base/charge/card';
  // request Loan
  static const String requestLoan = '$base/loans/request';
  static const String getLoanRequest = '$base/loans/my-requests';
  static const String getAllLoanRequest = '$base/loans';
  static const String pledgedLoan = '$base/my-pledges';


  
  //Found wallet 
  static const String foundWallet = '$base/charge/card';
  //bank 
  static const String getALlBanks = '$base/banks';
  static const String resolvedBank = '$base/banks/resolve';
  static const String saveBank = '$base/banks/resolve';
  static const String myBank = '$base/banks/my-banks';



  
  
}
