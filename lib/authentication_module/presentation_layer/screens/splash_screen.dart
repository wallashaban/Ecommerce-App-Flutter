import 'package:e_commerce_app/authentication_module/presentation_layer/screens/login_screen.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/core/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../widgets/main_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: TextWidget(
                text: 'ONLY ONE',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                lines: 1,
                textColor: AppColors.textBodyMediumColor,
              ),
            ),
            // const Spacer(),
            MainButton(
              text: 'Start',
              onClicked: () {
                SharedPreference.saveData(key: 'splash', value: true);
                pushReplacement(context: context, screen: LoginScreen());
              },
              fontSize: 25,
              fontWeight: FontWeight.bold,
              btnColor: Colors.white,
              style: FontStyle.italic,
              textColor: AppColors.textBodyMediumColor,
              elevation: 45,
              radius: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
