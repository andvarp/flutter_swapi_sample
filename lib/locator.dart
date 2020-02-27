import 'package:flutter_swapi_sample/core/services/swapi.dart';
import 'package:flutter_swapi_sample/core/services/swapi_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_swapi_sample/core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SwapiService());
  locator.registerLazySingleton(() => Swapi());

  locator.registerLazySingleton(() => HomeModel());
}
