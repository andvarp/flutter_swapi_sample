import 'package:flutter/foundation.dart';
import 'package:flutter_swapi_sample/core/enums/api_categories.dart';

class ApiCategories {
  Map<String, dynamic> categoriesMap = {};

  ApiCategories({this.categoriesMap});

  ApiCategories.fromJson(Map<String, dynamic> json) {
    categoriesMap = json;
  }

  Map<String, dynamic> toJson() {
    return categoriesMap;
  }

  bool get hasData {
    return (categoriesMap?.length ?? 0) > 0;
  }

  ApiCategoriesEnum apiCategoryToEnum(String category) =>
      ApiCategoriesEnum.values
          .firstWhere((e) => describeEnum(e).toString() == category);
}
