import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/notification.dart'
    as not;
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_cubit.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
        title: const TextWidget(
          text: 'Notifications',
          fontSize: 22,
          fontWeight: FontWeight.normal,
          lines: 1,
          textColor: AppColors.textBodyMediumColor,
        ),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is GetNotificationsLoadingState) {
            return circularProgress();
          }
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
              itemCount:
                  BlocProvider.of<SettingsCubit>(context).notifications.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return notificationWidget(
                    BlocProvider.of<SettingsCubit>(context)
                        .notifications[index],
                    context);
              },
            ),
          );
        },
      ),
    );
  }
}

Widget notificationWidget(not.Notification model, context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.textBodyMediumColor,
            child: Icon(
              Icons.notification_important_sharp,
              color: AppColors.myWhite,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              children: [
                TextWidget(
                  text: model.title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextWidget(
                  text: model.message,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  lines: 1,
                  textColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
