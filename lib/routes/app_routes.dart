import 'package:Biolx/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:Biolx/presentation/display_screen/display_screen.dart';
import 'package:Biolx/presentation/home_screen/home_screen.dart';
import 'package:Biolx/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String homeScreen = '/home_screen';

  static const String displayScreen = '/display_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    homeScreen: (context) => HomeScreen(),
    displayScreen: (context) => DisplayScreen(  nerPredictions: [], summary: " ",),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
