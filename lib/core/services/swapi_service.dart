import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/locator.dart';
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

  void log(dynamic log) {
    // TODO: remove this
    print('**********SwapiService*************');
    print(log);
    print('***********************************');
  }

  @override
  Future<StarWarsCollection<StarWarsPerson>> getPeople() async {
    StarWarsCollection<StarWarsPerson> people = await _swapi.people();
    log(people);
    return people;
  }

  @override
  Future<StarWarsCollection<StarWarsFilm>> getFilms() async {
    StarWarsCollection<StarWarsFilm> films = await _swapi.films();
    log(films);
    return films;
  }

  @override
  Future<StarWarsCollection<StarWarsPlanet>> getPlanets() async {
    StarWarsCollection<StarWarsPlanet> planets = await _swapi.planets();
    log(planets);
    return planets;
  }

  @override
  Future<StarWarsCollection<StarWarsSpecies>> getSpecies() async {
    StarWarsCollection<StarWarsSpecies> species =
        await _swapi.speciesCollection();
    log(species);
    return species;
  }

  @override
  Future<StarWarsCollection<StarWarsStarship>> getStarships() async {
    StarWarsCollection<StarWarsStarship> starship = await _swapi.starships();
    log(starship);
    return starship;
  }

  @override
  Future<StarWarsCollection<StarWarsVehicle>> getVehicles() async {
    StarWarsCollection<StarWarsVehicle> vehicles = await _swapi.vehicles();
    log(vehicles);
    return vehicles;
  }
}
