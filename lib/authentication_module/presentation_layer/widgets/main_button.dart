import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment alignment;
  final Color textColor;
  final FontStyle style;
  final Color btnColor;
  final double elevation;
  final double radius;
  final Color borderColor;
  final double width;
  final double height;
  const MainButton({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.fontSize,
    required this.fontWeight,
    this.style = FontStyle.normal,
    this.textColor = Colors.white,
    this.alignment = Alignment.center,
    this.elevation = 0.0,
    this.btnColor = AppColors.primaryColor,
    this.radius = 0.0,
    this.width = double.infinity,
    this.height = 70,
    this.borderColor = AppColors.textBodyMediumColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: BorderSide(color: borderColor)),
          elevation: 5,
        ),
        child: TextWidget(
            text: text, fontSize: fontSize, fontWeight: fontWeight, lines: 1,textColor: textColor,),
      ),
    );
  }
}
