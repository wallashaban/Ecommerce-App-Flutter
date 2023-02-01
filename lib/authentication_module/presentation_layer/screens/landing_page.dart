// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import '../../../core/utils/shared_preferences.dart';
import '../../../home_module/presentation_layer/screens/bottom_nav_bae_screen.dart';
import 'login_screen.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final  token = SharedPreference.getData(key: 'token');
  @override
  Widget build(BuildContext context) {
    if (token==null) {
      debugPrint(token);
      return const BottomNavigationbarScreen();
    }
    {
      debugPrint(token);
      return LoginScreen();
    }
  }
}
