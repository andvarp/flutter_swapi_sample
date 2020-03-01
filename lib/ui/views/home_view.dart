import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:flutter_swapi_sample/core/enums/api_categories.dart';
import 'package:flutter_swapi_sample/core/enums/view_state.dart';
import 'package:flutter_swapi_sample/ui/shared/loading.dart';
import 'package:flutter_swapi_sample/ui/widgets/card_image.dart';
import 'package:flutter_swapi_sample/ui/widgets/custom_sliver_app_bar.dart';
import 'package:flutter_swapi_sample/ui/widgets/custom_sliver_grid.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppModel _model = locator<AppModel>();

  Map<ApiCategoriesEnum, String> categoryImages = {
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

  Widget buildView() {
    Widget child = Container();

    if (_model.state == ViewState.Busy) {
      child = Loading(showLoading: true);
    } else if (_model?.apiCategories?.hasData ?? false) {
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
            title: 'Flutter\nSWAPI',
          ),
          buildGrid(),
        ],
      ),
    );
  }

  Widget buildNoDataContent() {
    return Container(child: Text('No data has found!'));
  }

  Widget buildGrid() {
    List<String> categories = _model.apiCategories.categoriesMap.keys.toList();

    return CustomSliverGrid(
      childBuilderDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          String category = categories[index];
          ApiCategoriesEnum apiCategoryEnum =
              _model.apiCategories.apiCategoryToEnum(category);
          String imageUrl = categoryImages[apiCategoryEnum];
          return CardImage(
            tag: apiCategoryEnum.toString(),
            imageUrl: imageUrl,
            label: category,
            onTap: () {
              Navigator.pushNamed(context, 'people');
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: buildView(),
    );
  }
}
