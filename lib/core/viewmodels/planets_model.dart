import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';
import 'package:swapi_client/swapi_client.dart';

class PlanetsModel extends BaseViewModel {
  StarWarsCollection<StarWarsPlanet> planets;

  void getPlanets(Future serviceCall, Function notifyListeners) async {
    setBusy(notifyListeners);

    StarWarsCollection<StarWarsPlanet> _planets = await serviceCall;
    bool success = _planets.results.length > 0;

    if (success) {
      planets = _planets;
    } else {
      error = 'Something happend. No data';
    }

    setIdle(notifyListeners);
  }
}
