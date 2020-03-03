import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';
import 'package:swapi_client/swapi_client.dart';

class SpeciesModel extends BaseViewModel {
  StarWarsCollection<StarWarsSpecies> species;

  void getSpecies(Future serviceCall, Function notifyListeners) async {
    setBusy(notifyListeners);

    StarWarsCollection<StarWarsSpecies> _species = await serviceCall;
    bool success = _species.results.length > 0;

    if (success) {
      species = _species;
    } else {
      error = 'Something happend. No data';
    }

    setIdle(notifyListeners);
  }
}
