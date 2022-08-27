import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  const CustomTextWidget(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      maxLines: 2,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
