import 'package:e_commerce_app/authentication_module/presentation_layer/controllers/authentication_cubit.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/controllers/authentication_states.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) { },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: SingleChildScrollView(child: CustomForm(
                      login: false,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      nameController: _nameController,
                      phoneController: _phoneController,
                      confirmPasswordController: _confirmPasswordController,
                    ),
                 
                )),
              ),
            ),
        );
      },
    );
  }
}
