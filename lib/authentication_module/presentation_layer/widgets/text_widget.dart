import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  //final TextStyle style;
  final double fontSize;
  final FontWeight fontWeight;
  final int lines;
  final Alignment alignment;
  final Color textColor;
  final FontStyle style;
  const TextWidget(
      {super.key,
      required this.text,
      // required this.style,

      required this.fontSize,
      required this.fontWeight,
      required this.lines,
      this.style=FontStyle.normal,
      this.textColor = AppColors.textBodyMediumColor,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        maxLines: lines,
        
        style: TextStyle(
          
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            color: textColor,
            fontStyle: style,
            
            ),
      ),
    );
  }
}
