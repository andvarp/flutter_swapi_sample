import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';
import 'package:swapi_client/swapi_client.dart';

class PeopleModel extends BaseViewModel {
  StarWarsCollection<StarWarsPerson> people;

  void getPeople(Future serviceCall, Function notifyListeners) async {
    setBusy(notifyListeners);

    StarWarsCollection<StarWarsPerson> _people = await serviceCall;
    bool success = _people.results.length > 0;

    if (success) {
      if ((people?.results?.length ?? 0) > 0) {
        List<StarWarsPerson> newResults =
            List<StarWarsPerson>.from(people.results)..addAll(_people.results);
        people = StarWarsCollection<StarWarsPerson>(
          count: _people.count,
          next: _people.next,
          previous: _people.previous,
          results: newResults,
        );
      } else {
        people = _people;
      }
    } else {
      error = 'Something happend. No data';
    }

    setIdle(notifyListeners);
  }
}
