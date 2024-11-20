import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/core/config/application_theme_manager.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/core/config/routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mal3abna App",
      theme: ApplicationThemeManager.lightTheme,
      initialRoute: PagesRouteName.initial,
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.onGeneratedRoutes,
    );
  }
}
