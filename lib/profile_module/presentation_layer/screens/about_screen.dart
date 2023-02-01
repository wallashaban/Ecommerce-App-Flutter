import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_cubit.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Center(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/about.png'),
                fit: BoxFit.contain,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextWidget(
                text: 'About Us',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                lines: 1,
                textColor: AppColors.textBodyMediumColor,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return TextWidget(
                    text:
                        BlocProvider.of<SettingsCubit>(context).settings.about,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    lines: 10,
                    textColor: AppColors.primaryColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
