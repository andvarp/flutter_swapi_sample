import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_swapi_sample/core/services/swapi.dart';
import 'package:flutter_swapi_sample/core/services/swapi_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SwapiService());
  locator.registerLazySingleton(() => Swapi());

  locator.registerSingleton<AppModel>(
    AppModelImplementation(),
    signalsReady: true,
  );
}
