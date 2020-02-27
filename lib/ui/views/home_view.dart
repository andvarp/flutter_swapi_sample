import 'package:flutter/material.dart';
import 'package:flutter_swapi_sample/core/viewmodels/home_model.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String title = 'SWAPI Demo';

  Widget renderCards(model) {
    bool hasData = model?.apiCategories?.hasData ?? false;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hasData
              ? Text(
                  'got data ${model.apiCategories.categoriesMap}',
                )
              : model.state == ViewState.Idle
                  ? FlatButton(
                      child: Text('Get Data'),
                      onPressed: () => model.getData(),
                    )
                  : CircularProgressIndicator(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => locator<HomeModel>(),
      child: Consumer<HomeModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: renderCards(model),
        );
      }),
    );
  }
}
