import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/form.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        return  Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                  child: SingleChildScrollView(
                child: CustomForm(
                  login: true,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              )),
            ),
          ),
         );
  }
}
