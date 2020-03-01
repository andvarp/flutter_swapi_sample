import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swapi_sample/ui/views/home_view.dart';
import 'package:flutter_swapi_sample/ui/views/default_view.dart';
import 'package:flutter_swapi_sample/ui/views/people_view.dart';

const String initialRoute = "home";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'people':
        return MaterialPageRoute(builder: (_) => PeopleView());
//      case:
//        return;
      default:
        return MaterialPageRoute(
            builder: (_) => DefaultView(settings: settings));
    }
  }
}
