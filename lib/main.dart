import 'package:flutter/material.dart';
import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:flutter_swapi_sample/ui/router.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => locator<AppModel>(),
      child: Consumer<AppModel>(
        builder: (context, model, child) => MaterialApp(
          darkTheme: ThemeData.dark(),
          initialRoute: initialRoute,
          onGenerateRoute: Router.generateRoute,
        ),
      ),
    );
  }
}
