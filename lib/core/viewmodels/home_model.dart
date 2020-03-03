import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/core/viewmodels/base_view_model.dart';

class HomeModel extends BaseViewModel {
  ApiCategories apiCategories;

  void getApiCategories(Future serviceCall, Function notifyListeners) async {
    setBusy(notifyListeners);

    ApiCategories _apiCategories = await serviceCall;
    bool success = _apiCategories.hasData;

    if (success) {
      apiCategories = _apiCategories;
    } else {
      error = 'Something happend. No data';
    }

    setIdle(notifyListeners);
  }
}
