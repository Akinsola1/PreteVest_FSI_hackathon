
import 'package:pretevest/core/repositories/auth_repositories.dart';
import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class AppProviders {
  //The providers for dependency injection and state management are to added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    //format for registering providers:
    ListenableProvider(create: (_) => AuthProvider()),
    ListenableProvider(create: (_) => UserProvider()),
   
  ];
}