import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/business_logic/profile_logic/profile_cubit.dart';
import 'package:weather_app/data/models/app_colors.dart';
import 'package:weather_app/presentation/custom_widgets/def_text_btn.dart';
import 'package:weather_app/presentation/custom_widgets/profile_item.dart';

import '../../data/constants/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit()..initProfileData(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var profileCubit = ProfileCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyProfileInfoItemWidget(
                      text: profileCubit.userName,
                      fontSize: 20.sp,
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w300,
                    ),
                    MyProfileInfoItemWidget(
                      text: profileCubit.userEmail,
                      fontSize: 20.sp,
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w300,
                    ),
                    MyProfileInfoItemWidget(
                      text: profileCubit.userPassword,
                      fontSize: 20.sp,
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w300,
                    ),
                    MyProfileInfoItemWidget(
                      text: profileCubit.userCountry,
                      fontSize: 20.sp,
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w300,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: CustomTextButtonWidget(
                            text: 'Change Data',
                            textColor: AppColors.secondColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            btnBackgroundColor: AppColors.white,
                            hasBorder: true,
                            borderRadius: 10,
                            borderColor: AppColors.mainColor,
                            onPressed: () {
                              Navigator.pushNamed(context, changeProfileDataScreenRoute);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}