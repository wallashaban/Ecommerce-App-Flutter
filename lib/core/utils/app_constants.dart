import 'package:e_commerce_app/authentication_module/presentation_layer/screens/landing_page.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication_module/presentation_layer/controllers/authentication_cubit.dart';
import '../../authentication_module/presentation_layer/widgets/main_button.dart';
import '../../authentication_module/presentation_layer/widgets/text_widget.dart';
import 'app_colors.dart';

class AppStrings {
  static const String loginHeading = 'Login to Only One';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String emailText = 'name@gmail.com';
  static const String emailValidationText = 'Email must not be empty';
  static const String passwordValidationText = 'Password must not be empty';
  static const String forgetPassword = 'Forget password?';
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String notMember = 'Not a Member Yet?';
  static const String member = 'Already have an account?';
  static const String name = 'Name';
  static const String nameText = 'Name';
  static const String nameValidationText = 'Name must not be empty';
  static const String price = 'Price';
  static const String describtion = 'Describtion';
  static const String searchBtn = 'Search';

  static const String phone = 'Phone';
  static const String phoneText = '0123 456 2345';
  static const String phoneValidationText = 'Phone must not be empty';

  static const String remeberMe = 'Remeber me';
  static const String categories = 'Categories';
  static const String total = 'Total';
  static const String products = 'All Products';

  static const String order = 'Order Now';
}

void signUp(
    {required String email,
    required String password,
    required context,
    required String name,
    required String phone}) {
  BlocProvider.of<AuthenticationCubit>(context).signUpUser(
    name: name,
    email: email,
    password: password,
    phone: phone,
  );
}

void signIn(String email, String password, context) {
  BlocProvider.of<AuthenticationCubit>(context).signInUser(
    email: email,
    password: password,
  );
}

///Navigation Problem!!!
void pushReplacement({required context, required screen}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => screen),
  );
}

void push({required context, required screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => screen),
  );
}

void showMessage({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Widget textAreaWidget(controller) => TextFormField(
    cursorColor: AppColors.textBodyMediumColor,
    controller: controller,
    textInputAction: TextInputAction.done,
    minLines: 5,
    maxLines: 5,
    keyboardType: TextInputType.multiline,
    validator: ((value) {
      if (value!.isEmpty) {
        return 'Please nter your name to send the complaint.';
      }
      return null;
    }),
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.myWhite,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          gapPadding: 30,
          borderSide: const BorderSide(
            color: AppColors.textBodyMediumColor,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          gapPadding: 30,
          borderSide: const BorderSide(
            color: AppColors.textBodyMediumColor,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          gapPadding: 30,
          borderSide: const BorderSide(
            color: AppColors.textBodyMediumColor,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          gapPadding: 30,
          borderSide: const BorderSide(
            color: AppColors.textBodyMediumColor,
            width: 5,
          )),
    ));

Widget circularProgress() => const Center(
      child: CircularProgressIndicator(
        color: AppColors.textBodyMediumColor,
      ),
    );

Future signOutDialog(context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            //padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30,
                ),
                color: AppColors.myWhite),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AlertDialog(
                  elevation: 0.0,
                  content: const TextWidget(
                    text: 'Are you Sure !!? 😪',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    lines: 1,
                    textColor: AppColors.textBodyMediumColor,
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainButton(
                            text: 'Yes 😥',
                            onClicked: (() {
                              token = '';
                              pushReplacement(
                                context: context,
                                screen: LandingPage(),
                              );
                            }),
                            textColor: AppColors.textBodyMediumColor,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            width: 100,
                            height: 40,
                          ),
                          MainButton(
                            textColor: AppColors.textBodyMediumColor,
                            text: 'No 😍',
                            onClicked: (() {
                              Navigator.pop(context);
                            }),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            width: 100,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
