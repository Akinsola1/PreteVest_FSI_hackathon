import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretevest/ui/screens/Authentication/authScreens.dart';
import 'package:pretevest/ui/screens/Authentication/signIn_screen.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  /// static const String splashScreen = '/splashScreen';

  static const String authScreen = 'authScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),
    authScreen: (context) => AuthScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add your screen here as well as the transition you want
      case authScreen:
        return MaterialPageRoute(
            builder: (context) => AuthScreen()); //Default Route is error route
      default:
        return CupertinoPageRoute(
            builder: (context) => errorView(settings.name));
    }
  }

  static Widget errorView(name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
