import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/main_button.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_input.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_cubit.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
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
          text: 'Add complaint',
          fontSize: 22,
          fontWeight: FontWeight.normal,
          lines: 1,
          textColor: AppColors.textBodyMediumColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    TextWidget(
                      text: 'Name',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                    verticalPadding: 0,
                    text: '',
                    controller: nameController,
                    isPassword: false,
                    action: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please nter your name to send the complaint.';
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),

                //Email
                Row(
                  children: const [
                    TextWidget(
                      text: 'Email',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                    verticalPadding: 0,
                    text: '',
                    controller: emailController,
                    isPassword: false,
                    action: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please nter your email to send the complaint.';
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),

                //phone

                Row(
                  children: const [
                    TextWidget(
                      text: 'Phone',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                    verticalPadding: 0,
                    text: '',
                    controller: phoneController,
                    isPassword: false,
                    action: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please nter your Phone to send the complaint.';
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: const [
                    TextWidget(
                      text: 'Add your complaint',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                textAreaWidget(messageController),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    if (state is AddComplaintLoadingState) {
                      return circularProgress();
                    }
                    return MainButton(
                      text: 'Send',
                      onClicked: () {
                        BlocProvider.of<SettingsCubit>(context).addComplaint(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          message: messageController.text,
                        );
                        if (state is AddComplaintErrorState) {
                          showMessage(
                            context: context,
                            text: state.error,
                          );
                        } else {
                          showMessage(
                            context: context,
                            text: BlocProvider.of<SettingsCubit>(context)
                                .complaints
                                .message,
                          );
                        }
                      },
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 60,
                      btnColor: AppColors.shadowSearchHomeColor,
                      textColor: AppColors.textBodyMediumColor,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  }
