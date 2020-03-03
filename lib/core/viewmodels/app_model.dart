import 'package:flutter/material.dart';
import 'package:flutter_swapi_sample/core/enums/view_state.dart';
import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/core/services/swapi_service.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:swapi_client/swapi_client.dart';

abstract class AppModel extends ChangeNotifier {
  ViewState get state;

  Future<bool> getPeople();
  StarWarsCollection<StarWarsPerson> get people;

  Future<bool> getPlanets();
  StarWarsCollection<StarWarsPlanet> get planets;

  Future<bool> getFilms();
  StarWarsCollection<StarWarsFilm> get films;

  Future<bool> getSpecies();
  StarWarsCollection<StarWarsSpecies> get species;

  Future<bool> getVehicles();
  StarWarsCollection<StarWarsVehicle> get vehicles;

  Future<bool> getStarships();
  StarWarsCollection<StarWarsStarship> get starships;

  Future<bool> getApiCategories();
  ApiCategories get apiCategories;
}

class AppModelImplementation extends AppModel {
  final SwapiService _swapiService = locator<SwapiService>();
  ViewState _state = ViewState.Idle;

  ApiCategories _apiCategories;
  StarWarsCollection<StarWarsPerson> _people;
  StarWarsCollection<StarWarsPlanet> _planets;
  StarWarsCollection<StarWarsFilm> _films;
  StarWarsCollection<StarWarsSpecies> _species;
  StarWarsCollection<StarWarsVehicle> _vehicles;
  StarWarsCollection<StarWarsStarship> _starships;

  AppModelImplementation() {
    getInitialData();
  }

  void getInitialData() async {
    var success = await getApiCategories();
    getPeople();
//    getPlanets();
//    getVehicles();
//    getSpecies();
//    getFilms();
//    getStarships();
    if (success) locator.signalReady(this);
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  ViewState get state => _state;

  @override
  ApiCategories get apiCategories => _apiCategories;

  @override
  StarWarsCollection<StarWarsPerson> get people => _people;

  @override
  StarWarsCollection<StarWarsFilm> get films => _films;

  @override
  StarWarsCollection<StarWarsPlanet> get planets => _planets;

  @override
  StarWarsCollection<StarWarsSpecies> get species => _species;

  @override
  StarWarsCollection<StarWarsStarship> get starships => _starships;

  @override
  StarWarsCollection<StarWarsVehicle> get vehicles => _vehicles;

  @override
  Future<bool> getPeople() async {
    setState(ViewState.Busy);

    var people = await _swapiService.getPeople();
    var success = people != null;

    if (success) {
      _people = people;
    }

    setState(ViewState.Idle);
    return success;
  }

  @override
  Future<bool> getFilms() async {
    setState(ViewState.Busy);

    var films = await _swapiService.getFilms();
    var success = films != null;

    if (success) {
      _films = films;
    }

    setState(ViewState.Idle);
    return success;
  }

  @override
  Future<bool> getPlanets() async {
    setState(ViewState.Busy);

    var planets = await _swapiService.getPlanets();
    var success = planets != null;

    if (success) {
      _planets = planets;
    }

    setState(ViewState.Idle);
    return success;
  }

  @override
  Future<bool> getSpecies() async {
    setState(ViewState.Busy);

    var species = await _swapiService.getSpecies();
    var success = species != null;

    if (success) {
      _species = species;
    }

    setState(ViewState.Idle);
    return success;
  }

  @override
  Future<bool> getStarships() async {
    setState(ViewState.Busy);

    var starships = await _swapiService.getStarships();
    var success = starships != null;

    if (success) {
      _starships = starships;
    }

    setState(ViewState.Idle);
    return success;
  }

  @override
  Future<bool> getVehicles() async {
    setState(ViewState.Busy);

    var vehicles = await _swapiService.getVehicles();
    var success = vehicles != null;

    if (success) {
      _vehicles = vehicles;
    }

    setState(ViewState.Idle);
    return success;
  }

  @override
  Future<bool> getApiCategories() async {
    setState(ViewState.Busy);

    var apiCategories = await _swapiService.getApiCategories();
    var success = apiCategories.hasData;

    if (success) {
      _apiCategories = apiCategories;
    }

    setState(ViewState.Idle);
    return success;
  }
}
