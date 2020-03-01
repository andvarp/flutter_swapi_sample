import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swapi_sample/core/enums/routes.dart';
import 'package:flutter_swapi_sample/ui/views/home_view.dart';
import 'package:flutter_swapi_sample/ui/views/default_view.dart';
import 'package:flutter_swapi_sample/ui/views/people_view.dart';

final String initialRoute = describeEnum(Routes.home);

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, MaterialPageRoute> routesConfig = {
      Routes.home: MaterialPageRoute(builder: (_) => HomeView()),
      Routes.people: MaterialPageRoute(builder: (_) => PeopleView()),
      Routes.defaultRoute: MaterialPageRoute(
        builder: (_) => DefaultView(settings: settings),
      ),
    }.map((k, v) => MapEntry(describeEnum(k), v));

    if (!routesConfig.containsKey(settings.name)) {
      return routesConfig[describeEnum(Routes.defaultRoute)];
    }

    return routesConfig[settings.name];
  }
}
