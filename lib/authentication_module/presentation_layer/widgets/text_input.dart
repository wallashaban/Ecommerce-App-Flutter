// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class TextInputWidget extends StatelessWidget {
  final String text;
  final bool isPassword;
  final TextInputType type;
  final TextEditingController controller;
  final TextInputAction action;
  final dynamic validator;
  final dynamic onSaved;
  final IconData? prefix;
  final IconData? suffix;
  final dynamic suffixPressed;
  final Color borderColor;
  final double raduis;
  final double verticalPadding;
  final double horizontalPadding;
  const TextInputWidget({
    super.key,
    required this.text,
    required this.controller,
    required this.isPassword,
    this.raduis = 35,
    this.type = TextInputType.text,
    required this.action,
    required this.validator,
    this.borderColor = AppColors.textBodyMediumColor,
    this.onSaved,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.verticalPadding = 20,
    this.horizontalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return 
    TextFormField(
        cursorColor: AppColors.textBodyMediumColor,
        onSaved: onSaved,
        controller: controller,
        obscureText: isPassword,
        textInputAction: action,
        keyboardType:type,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding),
          filled: true,
          fillColor: AppColors.myWhite,
          hintText: text,
          labelStyle: const TextStyle(color: AppColors.primaryColor),
          prefixIcon: Icon(
            prefix,
            color: AppColors.textBodyMediumColor,
          ),
          suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: AppColors.textBodyMediumColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                raduis,
              ),
              gapPadding: 30,
              borderSide: BorderSide(
                color: borderColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                raduis,
              ),
              gapPadding: 30,
              borderSide: BorderSide(
                color: borderColor,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                raduis,
              ),
              gapPadding: 30,
              borderSide: BorderSide(
                color: borderColor,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                raduis,
              ),
              gapPadding: 30,
              borderSide: const BorderSide(
                color: AppColors.textBodyMediumColor,
                width: 5,
              )),
        ));
  }
}
