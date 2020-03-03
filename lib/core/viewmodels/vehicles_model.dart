import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';
import 'package:swapi_client/swapi_client.dart';

class VehiclesModel extends BaseViewModel {
  StarWarsCollection<StarWarsVehicle> vehicles;

  void getVehicles(Future serviceCall, Function notifyListeners) async {
    setBusy(notifyListeners);

    StarWarsCollection<StarWarsVehicle> _vehicles = await serviceCall;
    bool success = _vehicles.results.length > 0;

    if (success) {
      vehicles = _vehicles;
    } else {
      error = 'Something happend. No data';
    }

    setIdle(notifyListeners);
  }
}
