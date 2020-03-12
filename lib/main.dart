import 'package:flutter/material.dart';
import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:flutter_swapi_sample/ui/router.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

ThemeData myTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.amber,
    accentColor: Colors.red,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      body1: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => locator<AppModel>(),
      child: Consumer<AppModel>(
        builder: (context, model, child) => MaterialApp(
          theme: myTheme(),
          initialRoute: initialRoute,
          onGenerateRoute: Router.generateRoute,
        ),
      ),
    );
  }
}
