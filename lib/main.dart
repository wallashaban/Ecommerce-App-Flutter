import 'package:e_commerce_app/authentication_module/presentation_layer/controllers/authentication_cubit.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/screens/splash_screen.dart';
import 'package:e_commerce_app/core/services/services_locator.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/bloc_observer.dart';
import 'package:e_commerce_app/core/utils/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'authentication_module/presentation_layer/screens/login_screen.dart';
import 'home_module/presentation_layer/screens/bottom_nav_bae_screen.dart';

Widget widget = const SplashScreen();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SharedPreference.init();
  await Firebase.initializeApp();
  ServicesLocator().init();
  final splash = SharedPreference.getData(
    key: 'splash',
  );
  final token = SharedPreference.getData(
    key: 'token',
  );
  if (token != null) {
    widget = const BottomNavigationbarScreen();
  } else {
    if (splash != null) {
      widget = LoginScreen();
    } else {
      widget = const SplashScreen();
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(sl(), sl()),
      child: MaterialApp(
        title: 'Ecommerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: AppColors.primaryColor,
            elevation: 0.0,
          ),
          scaffoldBackgroundColor: AppColors.scaffoldColor,
          primaryColor: AppColors.primaryColor,
          primarySwatch: Colors.amber,
        ),
        home: widget,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        localeResolutionCallback: ((locale, supportedLocales) {
          if (locale != null) {
            for(Locale locale in supportedLocales)
            {
              
            }
          }
          return supportedLocales.first;
        }),
      ),
    );
  }
}
