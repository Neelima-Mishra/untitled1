import 'package:flutter/material.dart';
import 'package:untitled1/resource/strings_manager.dart';
import '../app/di.dart';
import '../presentation/pages/auth/splash/splash_screen.dart';
import '../presentation/pages/list/list_page.dart';
import '../presentation/pages/navigation-bar/navigation_bar.dart';

class Routes {
  static const String splashRoute = '/splashRoute';
  static const String listRoute = '/ListScreen';
  static const String testRoute = '/TestRoute';
  static const String navigateRoute = '/NavigateRoute';
}

class RouteGenerator {
  Route<dynamic> getRoute(RouteSettings routeSettings) {
    //  String args = routeSettings.arguments.toString();
    switch (routeSettings.name) {
      case Routes.listRoute:
        return MaterialPageRoute(builder: (_) => ListPage());
      case Routes.splashRoute:
        initSplashModule();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.navigateRoute:
        initNavigationModule();
        return MaterialPageRoute(builder: (_) => const NavigationViewBar());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(StringManager.appBarTitle),
              ),
              body: const Center(
                child: Text('No Route Found'),
              ),
            ));
  }
}
