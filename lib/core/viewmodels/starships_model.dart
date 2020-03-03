import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';
import 'package:swapi_client/swapi_client.dart';

class StarshipsModel extends BaseViewModel {
  StarWarsCollection<StarWarsStarship> starships;

  void getStarships(Future serviceCall, Function notifyListeners) async {
    setBusy(notifyListeners);

    StarWarsCollection<StarWarsStarship> _starships = await serviceCall;
    bool success = _starships.results.length > 0;

    if (success) {
      starships = _starships;
    } else {
      error = 'Something happend. No data';
    }

    setIdle(notifyListeners);
  }
}
