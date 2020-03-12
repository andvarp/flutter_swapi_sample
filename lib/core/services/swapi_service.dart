import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:flutter_swapi_sample/utils/logger.dart';
import 'package:swapi_client/swapi_client.dart';

abstract class Swapi {
  Future<ApiCategories> getApiCategories();
  Future<StarWarsCollection<StarWarsPerson>> getPeople();
  Future<StarWarsCollection<StarWarsPlanet>> getPlanets();
  Future<StarWarsCollection<StarWarsFilm>> getFilms();
  Future<StarWarsCollection<StarWarsSpecies>> getSpecies();
  Future<StarWarsCollection<StarWarsVehicle>> getVehicles();
  Future<StarWarsCollection<StarWarsStarship>> getStarships();
}

class SwapiService extends Swapi {
  SwapiClient _swapi = locator<SwapiClient>();

  @override
  Future<ApiCategories> getApiCategories() async {
    var apiCategories = Future.delayed(
      Duration(
        milliseconds: 0,
      ),
      () => ApiCategories(categoriesMap: {
        "people": "https://swapi.co/api/people/",
        "planets": "https://swapi.co/api/planets/",
        "films": "https://swapi.co/api/films/",
        "species": "https://swapi.co/api/species/",
        "vehicles": "https://swapi.co/api/vehicles/",
        "starships": "https://swapi.co/api/starships/",
      }),
    );

    return apiCategories;
  }

  @override
  Future<StarWarsCollection<StarWarsPerson>> getPeople({
    int page = 1,
    String searchTerm,
  }) async {
    StarWarsCollection<StarWarsPerson> people =
        await _swapi.people(page: page, searchTerm: searchTerm);
    logger.i(people);
    return people;
  }

  @override
  Future<StarWarsCollection<StarWarsFilm>> getFilms() async {
    StarWarsCollection<StarWarsFilm> films = await _swapi.films();
    logger.i(films);
    return films;
  }

  @override
  Future<StarWarsCollection<StarWarsPlanet>> getPlanets() async {
    StarWarsCollection<StarWarsPlanet> planets = await _swapi.planets();
    logger.i(planets);
    return planets;
  }

  @override
  Future<StarWarsCollection<StarWarsSpecies>> getSpecies() async {
    StarWarsCollection<StarWarsSpecies> species =
        await _swapi.speciesCollection();
    logger.i(species);
    return species;
  }

  @override
  Future<StarWarsCollection<StarWarsStarship>> getStarships() async {
    StarWarsCollection<StarWarsStarship> starship = await _swapi.starships();
    logger.i(starship);
    return starship;
  }

  @override
  Future<StarWarsCollection<StarWarsVehicle>> getVehicles() async {
    StarWarsCollection<StarWarsVehicle> vehicles = await _swapi.vehicles();
    logger.i(vehicles);
    return vehicles;
  }
}
