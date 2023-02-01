import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_cubit.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/controllers/authentication_cubit.dart';
import '../../../authentication_module/presentation_layer/controllers/authentication_states.dart' as auth;
import '../../../authentication_module/presentation_layer/widgets/main_button.dart';
import '../../../authentication_module/presentation_layer/widgets/text_input.dart';
import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
          text: 'Change Password',
          fontSize: 22,
          fontWeight: FontWeight.normal,
          lines: 1,
          textColor: AppColors.textBodyMediumColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const TextWidget(
                    alignment: Alignment.topLeft,
                    text: 'Current Password',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    lines: 1,
                    style: FontStyle.italic,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
             BlocBuilder<AuthenticationCubit,auth. AuthenticationState>(
                        builder: (context, state) {
                          return TextInputWidget(
                            text: AppStrings.password,
                            controller: currentPasswordController,
                            isPassword:
                                BlocProvider.of<AuthenticationCubit>(context).isPassword,
                            action: TextInputAction.next,
                            validator: (value) {
                              if (value.isEmpty) {
                                return'Please enter your current password';
                              }
                            },
                            suffixPressed: () {
                              BlocProvider.of<AuthenticationCubit>(context)
                                  .changeIconState();
                            },
                            prefix: Icons.lock,
                            suffix: BlocProvider.of<AuthenticationCubit>(context).isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          );
                        },
                      ),     const SizedBox(
                    height: 30.0,
                  ),
                  const TextWidget(
                    alignment: Alignment.topLeft,
                    text: 'New passord',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    lines: 1,
                    style: FontStyle.italic,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                 BlocBuilder<AuthenticationCubit,auth. AuthenticationState>(
                        builder: (context, state) {
                          return TextInputWidget(
                            text: AppStrings.password,
                            controller: newPasswordController,
                            isPassword:
                                BlocProvider.of<AuthenticationCubit>(context).isPassword,
                            action: TextInputAction.next,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your new password';
                              }
                            },
                            suffixPressed: () {
                              BlocProvider.of<AuthenticationCubit>(context)
                                  .changeIconState();
                            },
                            prefix: Icons.lock,
                            suffix: BlocProvider.of<AuthenticationCubit>(context).isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          );
                        },
                      ),  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      if (state is ChangePasswordSuccessState) {
                        WidgetsBinding.instance
                            .addPostFrameCallback((_) => showMessage(
                                  context: context,
                                  text: BlocProvider.of<SettingsCubit>(context)
                                      .changePasswordModel
                                      .message,
                                ));
                      } else if (state is ChangePasswordErorrState) {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) => showMessage(context: context, text: state.error),
                        );
                      } else if (state is ChangePasswordLoadingState) {
                        return circularProgress();
                      }
                      return MainButton(
                        text: 'Change',
                        onClicked: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SettingsCubit>(context).changePassword(
                              currentPassword: currentPasswordController.text,
                              newPassword: newPasswordController.text,
                            );
                          }
                        },
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        btnColor: Colors.white,
                        style: FontStyle.italic,
                        textColor: AppColors.textBodyMediumColor,
                        elevation: 45,
                        radius: 80.0,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
