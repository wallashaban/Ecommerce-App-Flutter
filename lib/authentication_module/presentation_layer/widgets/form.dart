// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:e_commerce_app/authentication_module/presentation_layer/controllers/authentication_cubit.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/controllers/authentication_states.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/home_module/presentation_layer/screens/bottom_nav_bae_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_button.dart';
import 'text_input.dart';
import 'text_widget.dart';
import '../screens/login_screen.dart';
import '../screens/sign_up_screen.dart';

// ignore: must_be_immutable
class CustomForm extends StatelessWidget {
  final bool login;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final nameController;
  final phoneController;
  final confirmPasswordController;
  CustomForm({
    super.key,
    required this.login,
    required this.emailController,
    required this.passwordController,
    this.nameController,
    this.phoneController,
    this.confirmPasswordController,
  });
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //if (login)
          TextWidget(
            text: login ? AppStrings.loginHeading : AppStrings.signUp,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            lines: 1,
            textColor: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 50,
          ),
          if (!login)
            const TextWidget(
              alignment: Alignment.topLeft,
              text: AppStrings.name,
              fontSize: 15,
              fontWeight: FontWeight.normal,
              lines: 1,
              style: FontStyle.italic,
            ),
          if (!login)
            const SizedBox(
              height: 5,
            ),
          if (!login)
            TextInputWidget(
              text: AppStrings.nameText,
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
          if (!login)
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
            text: AppStrings.emailText,
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
          if (!login)
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
          if (!login)
            TextInputWidget(
              text: AppStrings.phoneText,
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
          if (!login)
            const SizedBox(
              height: 30.0,
            ),
          const TextWidget(
            alignment: Alignment.topLeft,
            text: AppStrings.password,
            fontSize: 15,
            fontWeight: FontWeight.normal,
            lines: 1,
            style: FontStyle.italic,
          ),
          const SizedBox(
            height: 5.0,
          ),
          BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              return TextInputWidget(
                text: AppStrings.password,
                controller: passwordController,
                isPassword:
                    BlocProvider.of<AuthenticationCubit>(context).isPassword,
                action: TextInputAction.next,
                validator: (value) {
                  if (value.isEmpty) {
                    return AppStrings.passwordValidationText;
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
          ),
          if (!login)
            const SizedBox(
              height: 30.0,
            ),
          if (!login)
            const SizedBox(
              height: 5.0,
            ),
          const SizedBox(
            height: 35.0,
          ),
          BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              if (state is SignInSuccessState || state is SignUpSuccessState) {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => pushReplacement(
                          context: context,
                          screen: const BottomNavigationbarScreen(),
                        ));
              } else if (state is SignInErorrState) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => showMessage(context: context, text: state.error),
                );
              } else if (state is SignUpErorrState) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => showMessage(context: context, text: state.error),
                );
              } else if (state is SignInLoadingState ||
                  state is SignUpLoadingState) {
                return circularProgress();
              }
              return MainButton(
                text: login ? AppStrings.signIn : AppStrings.signUp,
                onClicked: () {
                  if (_formKey.currentState!.validate()) {
                    login
                        ? signIn(
                            emailController.text,
                            passwordController.text,
                            context,
                          )
                        : signUp(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text);
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
          const SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: login ? AppStrings.notMember : AppStrings.member,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                lines: 1,
              ),
              TextButton(
                onPressed: () {
                  if (login) {
                    push(
                      context: context,
                      screen: SignUpScreen(),
                    );
                  } else {
                    push(
                      context: context,
                      screen: LoginScreen(),
                    );
                  }
                },
                child: TextWidget(
                  text: login ? AppStrings.signUp : AppStrings.signIn,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  lines: 1,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
