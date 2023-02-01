import 'package:e_commerce_app/core/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constants.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const TextWidget(
          text: 'Language',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          lines: 1,
          textColor: AppColors.textBodyMediumColor,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textBodyMediumColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          InkWell(
            onTap: () {
              lang = 'en';
              SharedPreference.saveData(key: 'language', value: lang);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextWidget(
                  text: 'English(United States)',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                Icon(Icons.check),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              lang = 'ar';
              SharedPreference.saveData(key: 'language', value: lang);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextWidget(
                  text: '(مصر)العربيه',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                Icon(Icons.check),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
