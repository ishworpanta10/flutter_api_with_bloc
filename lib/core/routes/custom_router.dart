import 'package:flutter/material.dart';
import 'package:flutter_api_test/models/models.dart';
import 'package:flutter_api_test/screens/screens.dart';
import 'package:flutter_api_test/screens/widgets/widgets.dart';

import 'route_constants.dart';

/// FUN [onGenerateRoute] : custom router to handle app routes
Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouteConstants.initialRoute:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case RouteConstants.routeNewsDetail:
      final newsModel = routeSettings.arguments as NewsModel;
      return MaterialPageRoute(
        builder: (context) => NewsDetailScreen(newsModel: newsModel),
      );

    /// handling default error routes cases
    default:
      return MaterialPageRoute(
        builder: (context) => const ErrorRouteScreen(),
      );
  }
}
