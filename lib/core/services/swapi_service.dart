import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:flutter_swapi_sample/core/services/swapi.dart';

class SwapiService {
  Swapi _swapi = locator<Swapi>();

  ApiCategories _apiCategories;
  ApiCategories get apiCategories => _apiCategories;

  Future<ApiCategories> getApiCategories() async {
    _apiCategories = await _swapi.getApiCategory();
    return _apiCategories;
  }
}
