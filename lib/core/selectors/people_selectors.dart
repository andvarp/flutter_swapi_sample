import 'package:flutter_swapi_sample/core/enums/view_state.dart';
import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:flutter_swapi_sample/core/viewmodels/people_model.dart';
import 'package:swapi_client/swapi_client.dart';

PeopleModel peopleModelSelector(AppModel model) => model?.peopleModel;

ViewState peopleModelStateSelector(AppModel model) =>
    peopleModelSelector(model)?.state;

StarWarsCollection<StarWarsPerson> peopleSelector(AppModel model) =>
    peopleModelSelector(model)?.people;
