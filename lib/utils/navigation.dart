import 'package:cattrivia/utils/project_router.dart';
import 'package:flutter/material.dart';

class Navigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static dynamic toPage(
    Routes route, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState!.pushNamed(
      route.name,
      arguments: arguments,
    );
  }

  // static dynamic toScreenWithBnb(
  //     Routes route, {
  //       required BuildContext context,
  //       Object? arguments,
  //     }) async {
  //   final RouteSettings settings = RouteSettings(
  //     name: route.name,
  //     arguments: arguments,
  //   );
  //   return await pushNewScreenWithRouteSettings(
  //     context,
  //     settings: settings,
  //     screen: (ProjectRouter.generateRoute(settings) as MaterialPageRoute)
  //         .builder(context),
  //   );
  // }

  static dynamic toPageWithReplacement(
    Routes route, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState!.pushReplacementNamed(
      route.name,
      arguments: arguments,
    );
  }

  static dynamic toPageAndCleanBackStack(
    Routes route, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      route.name,
      (_) => false,
      arguments: arguments,
    );
  }

  static dynamic toPageAndCleanBackStackUntil(
    Routes route,
    Routes lastRoute, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      route.name,
      (route) => route.settings.name == lastRoute.name,
      arguments: arguments,
    );
  }

  static void popUntil(BuildContext context, Routes route) {
    final String name = route.name;
    Navigator.popUntil(
      context,
      (route) => route.settings.name == name || !route.navigator!.canPop(),
    );
  }

  static void popUntilOneOf(BuildContext context, List<Routes> routes) {
    final List<String> names = routes.map((e) => e.name).toList();
    Navigator.popUntil(
      context,
      (route) =>
          names.contains(route.settings.name) || !route.navigator!.canPop(),
    );
  }
}
