import 'package:flutter/widgets.dart';
import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:provider/provider.dart';

class AppChangeNotifierProvider extends StatelessWidget {
  final Widget child;

  AppChangeNotifierProvider({this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => locator<AppModel>(),
      child: Consumer<AppModel>(builder: (context, model, child) => child),
    );
  }
}
