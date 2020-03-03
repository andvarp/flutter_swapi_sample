import 'package:flutter_swapi_sample/core/enums/view_state.dart';
import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';

HomeModel homeModelSelector(AppModel model) => model?.homeModel;

ViewState homeModelStateSelector(AppModel model) =>
    homeModelSelector(model)?.state;

ApiCategories apiCategoriesSelector(AppModel model) =>
    homeModelSelector(model)?.apiCategories;

List<String> apiCategoriesListSelector(AppModel model) =>
    apiCategoriesSelector(model)?.categoriesMap?.keys?.toList();
