import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swapi_sample/core/enums/api_categories.dart';
import 'package:flutter_swapi_sample/ui/widgets/card_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swapi_sample/core/viewmodels/home_model.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:flutter_swapi_sample/ui/widgets/custom_sliver_app_bar.dart';
import 'package:flutter_swapi_sample/ui/widgets/custom_sliver_grid.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _showGrid = false;
  HomeModel _model;

  Map categoryImages = {
    ApiCategoriesEnum.people:
        'https://upload.wikimedia.org/wikipedia/en/thumb/e/ee/Wicket_W_Warrick.png/220px-Wicket_W_Warrick.png',
    ApiCategoriesEnum.planets:
        'https://c4.wallpaperflare.com/wallpaper/170/165/99/space-planet-amoled-dark-vertical-hd-wallpaper-preview.jpg',
    ApiCategoriesEnum.films:
        'https://miro.medium.com/max/960/0*mFrLRixn7__X1tLH.jpg',
    ApiCategoriesEnum.species:
        'https://lumiere-a.akamaihd.net/v1/images/Jabba-The-Hutt_b5a08a70.jpeg',
    ApiCategoriesEnum.vehicles:
        'https://cdn.collider.com/wp-content/uploads/2017/08/star-wars-8-at-m6.jpg',
    ApiCategoriesEnum.starships:
        'https://img1.cgtrader.com/items/251200/cf0f0dc08c/millenium-falcon-space-ship-star-wars-3d-model-max-obj-3ds-fbx-c4d-lwo-lw-lws.jpg',
  };

  void loadData(model) async {
    bool result = await model.getData();
    setState(() {
      _showGrid = result;
    });
  }

  Widget renderLoading() {
    if (_model.state == ViewState.Idle) return null;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget renderContent(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(
            title: 'Flutter\nSWAPI',
          ),
          renderGrid(),
        ],
      ),
    );
  }

  Widget renderGrid() {
    List<String> categories = _model.apiCategories.categoriesMap.keys.toList();

    return CustomSliverGrid(
      childBuilderDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          String category = categories[index];
          ApiCategoriesEnum apiCategoryEnum =
              _model.apiCategories.apiCategoryToEnum(category);
          String imageUrl = categoryImages[apiCategoryEnum];
          return CardImage(
            imageUrl: imageUrl,
            label: category,
            onTap: () {
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
    return ChangeNotifierProvider(
      builder: (context) => locator<HomeModel>(),
      child: Consumer<HomeModel>(builder: (context, model, child) {
        _model = model;

        // Trigger Initial Data Loading
        if (_model.state == ViewState.Idle && !_showGrid) {
          loadData(_model);
        }
        return Scaffold(
          backgroundColor: Colors.black,
          body: Builder(
            builder: (ctx) => _showGrid ? renderContent(ctx) : renderLoading(),
          ),
        );
      }),
    );
  }
}
