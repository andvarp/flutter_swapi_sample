import 'package:flutter/material.dart';
import 'package:flutter_swapi_sample/ui/router.dart';
import 'package:flutter_swapi_sample/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      initialRoute: initialRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
