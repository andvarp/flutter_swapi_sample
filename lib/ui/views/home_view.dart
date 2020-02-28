import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    ;
  }

  Widget renderContent(context) {
    // ${model.apiCategories.categoriesMap}
    return renderGrid(context);
  }

  Widget renderGrid(context) {
    // _model
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(
            title: 'Flutter\nSWAPI',
          ),
          CustomSliverGrid(
            childBuilderDelegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index + 1 % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 6,
            ),
          ),
        ],
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

///////////

//  void openSnackBar(text) {
//    Scaffold.of(context).showSnackBar(SnackBar(
//      duration: Duration(milliseconds: 600),
//      content: Text(text),
//    ));
//  }
//  Widget renderGestureDetector({tapText, child}) {
//    return GestureDetector(
//      child: child,
//      onTap: () {
//        print('tap here!');
//        print(tapText);
//        openSnackBar(tapText);
//      },
//    );
//  }
