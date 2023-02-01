import 'package:e_commerce_app/core/services/services_locator.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_cubit.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_states.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/controllers/authentication_cubit.dart';
import '../../../authentication_module/presentation_layer/widgets/main_button.dart';
import '../../../authentication_module/presentation_layer/widgets/text_input.dart';
import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    nameController.text =
        BlocProvider.of<AuthenticationCubit>(context).authenticationModel.name;
    emailController.text =
        BlocProvider.of<AuthenticationCubit>(context).authenticationModel.email;
    phoneController.text =
        BlocProvider.of<AuthenticationCubit>(context).authenticationModel.phone;
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
          text: 'Edit Profile',
          fontSize: 22,
          fontWeight: FontWeight.normal,
          lines: 1,
          textColor: AppColors.textBodyMediumColor,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 70, bottom: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 102,
                  width: 102,
                  decoration: BoxDecoration(
                    border: const Border(
                      bottom: BorderSide(color: AppColors.textBodyMediumColor),
                      top: BorderSide(color: AppColors.textBodyMediumColor),
                      left: BorderSide(color: AppColors.textBodyMediumColor),
                      right: BorderSide(color: AppColors.textBodyMediumColor),
                    ),
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    color: AppColors.textBodyMediumColor,
                  ),
                  child: Image(
                    image: NetworkImage(
                      BlocProvider.of<AuthenticationCubit>(context)
                          .authenticationModel
                          .image,
                    ),
                    fit: BoxFit.contain,
                    width: 100,
                    height: 100,
                  ),
                ),
                const TextWidget(
                  alignment: Alignment.topLeft,
                  text: AppStrings.name,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  lines: 1,
                  style: FontStyle.italic,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                  text: BlocProvider.of<AuthenticationCubit>(context)
                      .authenticationModel
                      .name,
                  controller: nameController,
                  isPassword: false,
                  action: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.nameValidationText;
                    }
                  },
                  prefix: Icons.person,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const TextWidget(
                  alignment: Alignment.topLeft,
                  text: AppStrings.email,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  lines: 1,
                  style: FontStyle.italic,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                  type: TextInputType.emailAddress,
                  text: BlocProvider.of<AuthenticationCubit>(context)
                      .authenticationModel
                      .email,
                  controller: emailController,
                  isPassword: false,
                  action: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.emailValidationText;
                    }
                  },
                  prefix: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const TextWidget(
                  alignment: Alignment.topLeft,
                  text: AppStrings.phone,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  lines: 1,
                  style: FontStyle.italic,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                  text: BlocProvider.of<AuthenticationCubit>(context)
                      .authenticationModel
                      .phone,
                  controller: phoneController,
                  isPassword: false,
                  action: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.phoneValidationText;
                    }
                  },
                  prefix: Icons.phone_android_outlined,
                ),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        push(
                          context: context,
                          screen: BlocProvider(
                            create: (context) => sl<SettingsCubit>(),
                            child: ChangePasswordScreen(),
                          ),
                        );
                      },
                      child: const TextWidget(
                        text: 'Change Password?',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        lines: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    if (state is UpdateUserSuccessState) {
                      WidgetsBinding.instance
                          .addPostFrameCallback((_) => showMessage(
                                context: context,
                                text: BlocProvider.of<SettingsCubit>(context)
                                    .updateProfileModel
                                    .message,
                              ));
                    } else if (state is UpdateUserErorrState) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) => showMessage(context: context, text: state.error),
                      );
                    } else if (state is UpdateUserLoadingState) {
                      return circularProgress();
                    }
                    return MainButton(
                      text: 'Edit',
                      onClicked: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<SettingsCubit>(context).updateProfile(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                            image: BlocProvider.of<AuthenticationCubit>(context)
                                .authenticationModel
                                .image,
                            password: '123456789',
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
    );
  }
}
