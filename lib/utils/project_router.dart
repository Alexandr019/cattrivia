import 'package:cattrivia/feature/cat_trivia/cat_trivia_page.dart';
import 'package:cattrivia/feature/history/history_page.dart';
import 'package:flutter/material.dart';

const _catTrivia = '/catTrivia';
const _history = '/history';

class ProjectRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _catTrivia:
        return _buildRoute(const CatTriviaPage());
      case _history:
        return _buildRoute(const History());

      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}

enum Routes { cattrivia, history }

extension RoutNames on Routes {
  String get name {
    switch (this) {
      case Routes.cattrivia:
        return _catTrivia;
      case Routes.history:
        return _history;
    }
  }
}
