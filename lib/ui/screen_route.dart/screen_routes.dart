import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretevest/ui/screens/Authentication/authScreens.dart';
import 'package:pretevest/ui/screens/Authentication/completion_screen.dart';
import 'package:pretevest/ui/screens/Authentication/signIn_screen.dart';
import 'package:pretevest/ui/screens/bank/bankScreen.dart';
import 'package:pretevest/ui/screens/dashboard/dashboard.dart';
import 'package:pretevest/ui/screens/dashboard/nav_bar.dart';
import 'package:pretevest/ui/screens/foundWallet/foundWalletScreen.dart';
import 'package:pretevest/ui/screens/invest/investScreen.dart';
import 'package:pretevest/ui/screens/loan/loanScreen.dart';
import 'package:pretevest/ui/screens/setting/setting_screen.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  /// static const String splashScreen = '/splashScreen';

  static const String authScreen = 'authScreen';
  // static const String completionScreen = 'completionScreen';
  static const String dashBoard = 'dashBoard';
  static const String navBar = 'navBar';
  static const String settingScreen = 'settingScreen';
  static const String loanScreen = 'loanScreen';
  static const String investScreen = 'investScreen';
  static const String foundWalletScreen = 'foundWalletScreen';
  static const String bankScreen = 'bankScreen';


  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),
    authScreen: (context) => AuthScreen(),
    // completionScreen: (context) => CompletionScreen(),
    dashBoard: (context) => DashBoard(),
    navBar:  (context) => base_screen(),

    settingScreen: (context) => SettingScreen(),
    loanScreen: (context) => LoanScreen(),
    investScreen: (context) => InvestScreen(),
    foundWalletScreen: (context) => FoundWalletScreen(),
    bankScreen: (context) => BankScreen(),

  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add your screen here as well as the transition you want
      case authScreen:
        return MaterialPageRoute(builder: (context) => AuthScreen());
      // case completionScreen:
        // return MaterialPageRoute(builder: (context) => CompletionScreen());
      case dashBoard:
        return MaterialPageRoute(builder: (context) => DashBoard());
      case navBar:
        return MaterialPageRoute(builder: (context) => base_screen());
      case settingScreen:
        return MaterialPageRoute(builder: (context) => SettingScreen());
      case loanScreen:
        return MaterialPageRoute(builder: (context) => LoanScreen());
      case investScreen:
        return MaterialPageRoute(builder: (context) => InvestScreen());
      case foundWalletScreen:
        return MaterialPageRoute(builder: (context) => FoundWalletScreen());
      case bankScreen:
        return MaterialPageRoute(builder: (context) => BankScreen());
      //Default Route is error route
      default:
        return CupertinoPageRoute(
            builder: (context) => errorView(settings.name));
    }
  }

  static Widget errorView(name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
