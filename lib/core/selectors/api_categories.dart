import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';

ApiCategories apiCategoriesSelector(AppModel model) => model?.apiCategories;

List<String> apiCategoriesListSelector(AppModel model) =>
    apiCategoriesSelector(model)?.categoriesMap?.keys?.toList();
