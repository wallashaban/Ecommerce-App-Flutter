

import 'package:e_commerce_app/authentication_module/presentation_layer/screens/sign_up_screen.dart';
import 'package:e_commerce_app/core/utils/routes.dart';
import 'package:e_commerce_app/home_module/presentation_layer/screens/bottom_nav_bae_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../authentication_module/presentation_layer/screens/landing_page.dart';
import '../../authentication_module/presentation_layer/screens/login_screen.dart';
import '../../home_module/presentation_layer/screens/home_screen.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landingPageRoute:
      return CupertinoPageRoute(
        builder: (_) =>  LandingPage(),
        settings: settings,
      );
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) =>  LoginScreen(),
        settings: settings,
      );
      case AppRoutes.signupPageRoute:
      return CupertinoPageRoute(
        builder: (_) =>  SignUpScreen(),
        settings: settings,
      );
    case AppRoutes.bottomNavbarPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavigationbarScreen(),
        settings: settings,
      );
      case AppRoutes.homePageRoute:
      return CupertinoPageRoute(
        builder: (_) => const HomeScreen(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) =>  LandingPage(),
        settings: settings,
      );
  }
}
