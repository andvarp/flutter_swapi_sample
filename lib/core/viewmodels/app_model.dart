import 'package:flutter/material.dart';
import 'package:flutter_swapi_sample/core/enums/view_state.dart';
import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/core/services/swapi_service.dart';
import 'package:flutter_swapi_sample/locator.dart';

abstract class AppModel extends ChangeNotifier {
  ViewState get state;

  Future<bool> getApiCategories();
  ApiCategories get apiCategories;
}

class AppModelImplementation extends AppModel {
  final SwapiService _swapiService = locator<SwapiService>();
  ViewState _state = ViewState.Idle;
  ApiCategories _apiCategories = ApiCategories();

  AppModelImplementation() {
    getInitialData();
  }

  void getInitialData() async {
    var success = await getApiCategories();
    if (success) locator.signalReady(this);
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  ViewState get state => _state;

  @override
  ApiCategories get apiCategories => _apiCategories;

  @override
  Future<bool> getApiCategories() async {
    setState(ViewState.Busy);

    var apiCategories = await _swapiService.getApiCategories();
    var success = apiCategories.hasData;

    if (success) {
      _apiCategories = apiCategories;
    }

    setState(ViewState.Idle);
    return success;
  }
}
