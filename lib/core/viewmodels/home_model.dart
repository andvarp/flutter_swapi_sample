import 'package:flutter/foundation.dart';
import 'package:flutter_swapi_sample/core/enums/view_state.dart';
import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/core/services/swapi_service.dart';
import 'package:flutter_swapi_sample/locator.dart';

class HomeModel extends ChangeNotifier {
  final SwapiService _swapiService = locator<SwapiService>();

  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  ApiCategories get apiCategories => _swapiService.apiCategories;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> getData() async {
    setState(ViewState.Busy);
    var success = await _swapiService.getData();
    setState(ViewState.Idle);
    return success;
  }
}
