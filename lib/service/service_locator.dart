import 'package:voco/export/package_exports.dart';
import 'package:voco/export/service_exports.dart';

final locator = GetIt.instance;

serviceLocatorInit() {
  locator.registerLazySingleton(() => SharedPrefService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => HomeService());
}
