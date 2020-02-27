import 'dart:convert';
import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:http/http.dart' as http;

class Swapi {
  static const endpoint = 'https://swapi.co/api/';
  var client = new http.Client();

  Future<ApiCategories> getApiCategory() async {
    var response = await client.get(endpoint);
    return ApiCategories.fromJson(json.decode(response.body));
  }
}
