import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final Color btnBackgroundColor;
  final double borderSize;
  final double borderRadius;
  final bool hasBorder;
  final Color borderColor;
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomTextButtonWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.btnBackgroundColor,
    required this.hasBorder,
    this.borderRadius = 0,
    required this.onPressed,
    this.borderSize = 1,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(color: textColor,fontWeight: fontWeight,fontSize: fontSize)),
      style: TextButton.styleFrom(
        backgroundColor: btnBackgroundColor,
        shape: hasBorder
            ? RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor,
              width: borderSize,
            ),
            borderRadius: BorderRadius.circular(borderRadius))
            : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
    );
  }
}
