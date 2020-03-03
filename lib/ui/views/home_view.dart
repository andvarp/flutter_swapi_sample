import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swapi_sample/core/enums/routes.dart';
import 'package:flutter_swapi_sample/core/models/api_categories.dart';
import 'package:flutter_swapi_sample/core/selectors/home_selectors.dart';
import 'package:flutter_swapi_sample/core/viewmodels/view_models.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:flutter_swapi_sample/core/enums/api_categories.dart';
import 'package:flutter_swapi_sample/core/enums/view_state.dart';
import 'package:flutter_swapi_sample/ui/shared/loading.dart';
import 'package:flutter_swapi_sample/ui/widgets/card_image.dart';
import 'package:flutter_swapi_sample/ui/widgets/custom_sliver_app_bar.dart';
import 'package:flutter_swapi_sample/ui/widgets/custom_sliver_grid.dart';
import 'package:flutter_swapi_sample/utils/utils.dart';

final String title = 'Flutter\nSWAPI';
final String noDataFound = 'No data has found!';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppModel _model = locator<AppModel>();
  ViewState _state;
  ApiCategories _apiCategories;
  List<String> _categories;

  Widget buildView() {
    Widget child = Container();

    if (_state == ViewState.Busy) {
      child = Loading(showLoading: true);
    } else if (_apiCategories?.hasData ?? false) {
      child = buildContent();
    } else {
      child = buildNoDataContent();
    }

    return child;
  }

  Widget buildContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(
            title: title,
          ),
          buildGrid(),
        ],
      ),
    );
  }

  Widget buildNoDataContent() {
    return Container(child: Text(noDataFound));
  }

  Widget buildGrid() {
    List<String> categories = _categories;

    return CustomSliverGrid(
      childBuilderDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          String category = categories[index];
          ApiCategoriesEnum apiCategoryEnum =
              _apiCategories.apiCategoryToEnum(category);
          return CardImage(
            tag: apiCategoryEnum.toString(),
            imageUrl: categoryImagesMap[apiCategoryEnum],
            label: category,
            onTap: () {
              Navigator.pushNamed(context, describeEnum(Routes.people));
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Tap $category'),
                  duration: Duration(milliseconds: 300),
                ),
              );
            },
          );
        },
        childCount: categories.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getSelectorValues();

    return Scaffold(
      backgroundColor: Colors.black,
      body: buildView(),
    );
  }

  void getSelectorValues() {
    _state = homeModelStateSelector(_model);
    _apiCategories = apiCategoriesSelector(_model);
    _categories = apiCategoriesListSelector(_model);
  }
}
