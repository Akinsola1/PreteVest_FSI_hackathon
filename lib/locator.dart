





import 'package:get_it/get_it.dart';
import 'package:pretevest/core/api/Authentication_api/authentication_api.dart';
import 'package:pretevest/core/api/Authentication_api/authentication_implementation.dart';
import 'package:pretevest/core/api/User_api/user_api.dart';
import 'package:pretevest/core/api/User_api/user_implementation.dart';
import 'package:pretevest/core/api/api_utils/api_helper.dart';


GetIt locator = GetIt.instance;
void setupLocator() {
  // services
  locator.registerLazySingleton<API>(() => API());
  // locator.registerLazySingleton<MapService>(() => MapService());

  // API
  locator.registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());
  locator.registerLazySingleton<UserApi>(() => UserApiImplementation());


 

  

  // Infrastructure
  // locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());
}
