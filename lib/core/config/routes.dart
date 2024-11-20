
import 'package:flutter/material.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/features/game_view_feature/pages/game_view_screen.dart';
import 'package:mal3abna/features/home_feature/pages/home_page.dart';
import 'package:mal3abna/features/splash_feature/splash_screen.dart';

class Routes {
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case PagesRouteName.homePage:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: settings,
        );

      case PagesRouteName.gameView:
        return MaterialPageRoute(
            builder: (context) => const GameViewScreen(), settings: settings);


      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
