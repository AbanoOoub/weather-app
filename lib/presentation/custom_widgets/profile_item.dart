import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/data/models/app_colors.dart';
import 'package:weather_app/presentation/custom_widgets/def_text.dart';

class MyProfileInfoItemWidget extends StatelessWidget {
  const MyProfileInfoItemWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                    text: text,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    textColor: textColor),
              ],
            ),
          ),
          Divider(
            color: AppColors.secondColor,
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
