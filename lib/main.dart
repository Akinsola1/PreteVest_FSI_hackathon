import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'ui/screen_route.dart/screen_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: RouteNames.routes,
      initialRoute: RouteNames.authScreen,
      onGenerateRoute: RouteNames.generateRoute,
      navigatorKey: Get.key,
    );
  }
}
