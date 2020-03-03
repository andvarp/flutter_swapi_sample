import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:swapi_client/swapi_client.dart';

StarWarsCollection<StarWarsPerson> peopleSelector(AppModel model) {
  return model?.people;
}
