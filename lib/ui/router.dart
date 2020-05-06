import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swapi_sample/core/enums/routes.dart';
import 'package:flutter_swapi_sample/ui/views/home_view.dart';
import 'package:flutter_swapi_sample/ui/views/default_view.dart';
import 'package:flutter_swapi_sample/ui/views/people/people_view.dart';
import 'package:flutter_swapi_sample/ui/views/people/people_detail_view.dart';

final String initialRoute = describeEnum(Routes.home);

class Router {
  static MaterialPageRoute materialPageRouteBuilder(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, MaterialPageRoute> routesConfig = {
      Routes.defaultRoute: generateUnknownRoute(settings),
      Routes.home: materialPageRouteBuilder(HomeView()),
      Routes.people: materialPageRouteBuilder(PeopleView()),
      Routes.personDetail: materialPageRouteBuilder(PeopleDetailView(
        person: settings.arguments,
      )),
    }.map((k, v) => MapEntry(describeEnum(k), v));

    if (!routesConfig.containsKey(settings.name)) {
      return routesConfig[describeEnum(Routes.defaultRoute)];
    }

    return routesConfig[settings.name];
  }

  static Route<dynamic> generateUnknownRoute(RouteSettings settings) {
    return materialPageRouteBuilder(DefaultView(settings: settings));
  }
}
