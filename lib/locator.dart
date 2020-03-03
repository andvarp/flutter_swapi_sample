import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_swapi_sample/core/services/swapi_service.dart';
import 'package:swapi_client/swapi_client.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SwapiClient());
  locator.registerLazySingleton(() => SwapiService());

  locator.registerSingleton<AppModel>(
    AppModelImplementation(),
    signalsReady: true,
  );
}
