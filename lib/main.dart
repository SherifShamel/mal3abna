import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mal3abna/core/config/application_theme_manager.dart';
import 'package:mal3abna/core/config/constants.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/core/config/routes.dart';
import 'package:mal3abna/models/player_model.dart';
import 'package:mal3abna/simple_bloc_observer.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  await Hive.openBox(kPlayersBox);
  Hive.registerAdapter(PlayerModelAdapter());

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
      debugShowCheckedModeBanner: false,
      title: "Mal3abna App",
      theme: ApplicationThemeManager.lightTheme,
      initialRoute: PagesRouteName.initial,
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.onGeneratedRoutes,
    );
  }
}
