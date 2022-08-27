import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/data/constants/strings.dart';
import 'package:weather_app/presentation/custom_widgets/def_text.dart';

import '../../data/models/app_colors.dart';
import '../custom_widgets/def_text_btn.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'Welcome to Weather',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                textColor: AppColors.secondColor,
              ),
              CustomTextWidget(
                text: 'A simple application to know the weather for every one use',
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                textColor: AppColors.secondColor,
              ),
              SizedBox(height: 5.h),
              SizedBox(height: 50.h,width: double.infinity,child: Image.asset(weatherImg)),
              SizedBox(height: 10.h),
              Center(
                child: SizedBox(
                  width: 80.w,
                  height: 7.h,
                  child: CustomTextButtonWidget(
                      text: 'Sign Up',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      textColor: AppColors.secondColor,
                      btnBackgroundColor: AppColors.mainColor,
                      hasBorder: false,
                      borderRadius: 10,
                      onPressed: () {
                        Navigator.pushNamed(context, registerScreenRoute);
                      }),
                ),
              ),
              SizedBox(height: 2.h),
              Center(
                child: SizedBox(
                  width: 80.w,
                  height: 7.h,
                  child: CustomTextButtonWidget(
                      text: 'Sign In',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      textColor: AppColors.secondColor,
                      btnBackgroundColor: AppColors.white,
                      borderColor: AppColors.mainColor,
                      borderSize: 2,
                      hasBorder: true,
                      borderRadius: 10,
                      onPressed: () {
                        Navigator.pushNamed(context, loginScreenRoute);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
