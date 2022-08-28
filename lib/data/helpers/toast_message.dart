import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/data/models/app_colors.dart';

void toast({required String msg}) {
  BotToast.showText(
      text: msg,
      align: Alignment.bottomCenter,
      textStyle: TextStyle(
          color: AppColors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w300));
}
