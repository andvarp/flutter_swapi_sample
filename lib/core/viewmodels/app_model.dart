import 'package:flutter/widgets.dart';
import 'package:flutter_swapi_sample/core/services/swapi_service.dart';
import 'package:flutter_swapi_sample/core/viewmodels/home_model.dart';
import 'package:flutter_swapi_sample/core/viewmodels/people_model.dart';
import 'package:flutter_swapi_sample/locator.dart';

class AppModel extends ChangeNotifier {
  final SwapiService _swapiService = locator<SwapiService>();

  HomeModel _homeModel = HomeModel();
  PeopleModel _peopleModel = PeopleModel();

  AppModel() {
    getApiCategories();
    getPeople();
//    getFilms();
//    getPlanets();
//    getSpecies();
//    getStarships();
//    getVehicles();
  }

  HomeModel get homeModel => _homeModel;
  PeopleModel get peopleModel => _peopleModel;

  void getApiCategories() {
    _homeModel.getApiCategories(
        _swapiService.getApiCategories(), notifyListeners);
  }

  void getPeople({
    int page = 1,
    String searchTerm,
  }) {
    _peopleModel.getPeople(
        _swapiService.getPeople(page: page, searchTerm: searchTerm),
        notifyListeners);
  }
}
