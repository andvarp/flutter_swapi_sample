import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';
import 'package:swapi_client/swapi_client.dart';

class FilmsModel extends BaseViewModel {
  StarWarsCollection<StarWarsFilm> films;

  void getFilms(Future serviceCall, Function notifyListeners) async {
    setBusy(notifyListeners);

    StarWarsCollection<StarWarsFilm> _films = await serviceCall;
    bool success = _films.results.length > 0;

    if (success) {
      films = _films;
    } else {
      error = 'Something happend. No data';
    }

    setIdle(notifyListeners);
  }
}
