import 'package:flutter_swapi_sample/core/viewmodels/starships_model.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_swapi_sample/core/services/swapi_service.dart';
import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';
import 'package:swapi_client/swapi_client.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SwapiClient());
  locator.registerLazySingleton(() => SwapiService());

  locator.registerLazySingleton(() => BaseViewModel());
  locator.registerLazySingleton(() => FilmsModel());
  locator.registerLazySingleton(() => HomeModel());
  locator.registerLazySingleton(() => PeopleModel());
  locator.registerLazySingleton(() => PlanetsModel());
  locator.registerLazySingleton(() => SpeciesModel());
  locator.registerLazySingleton(() => StarshipsModel());
  locator.registerLazySingleton(() => VehiclesModel());

  locator.registerLazySingleton(() => AppModel());
}
