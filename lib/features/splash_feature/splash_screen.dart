import 'package:flutter/material.dart';
import 'package:mal3abna/core/config/application_theme_manager.dart';
import 'package:mal3abna/core/config/constants.dart';
import 'package:mal3abna/core/config/page_route_names.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: InkWell(
              onTap: () => navigatorKey.currentState!
                  .pushReplacementNamed(PagesRouteName.homePage),
              child: Container(
                decoration: BoxDecoration(
                  color: ApplicationThemeManager.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                width: 160,
                height: 150,
                child: Center(
                  child: Text(
                    "Mal3abna",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Constants.getMediaQuery(context).height * 0.4,
            left: -10,
            child: Column(
              children: [
                const Text("Tap Here To Enter!"),
                Image.asset(
                  "assets/ArrowAnimation.gif",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
