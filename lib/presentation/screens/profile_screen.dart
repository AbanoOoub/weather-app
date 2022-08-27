import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
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
                      fontSize: 12.sp,
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w300,
                    ),
                    MyProfileInfoItemWidget(
                      text: profileCubit.userEmail,
                      fontSize: 12.sp,
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w300,
                    ),
                    MyProfileInfoItemWidget(
                      text: profileCubit.userPassword,
                      fontSize: 12.sp,
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w300,
                    ),
                    MyProfileInfoItemWidget(
                      text: profileCubit.userCountry,
                      fontSize: 12.sp,
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.w300,
                    ),
                    Center(
                      child: SizedBox(
                        width: 90.w,
                        height: 6.h,
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

// CustomTextInput(
//     hint: 'Name',
//     controller: fullNameController,
//     prefixIcon: Icons.person,
//     type: TextInputType.text),

// CustomTextButtonWidget(
//     text: 'Update',
//     textColor: AppColors.secondColor,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w300,
//     btnBackgroundColor: AppColors.white,
//     hasBorder: true,
//     borderColor: AppColors.mainColor,
//     onPressed: () {}),

// CustomTextInput(
//     hint: 'Country',
//     controller: countyController,
//     prefixIcon: Icons.location_on,
//     type: TextInputType.emailAddress),

// CustomTextInput(
//     hint: 'new password',
//     controller: emailController,
//     prefixIcon: Icons.lock,
//     type: TextInputType.emailAddress),

// CustomTextInput(
//     hint: 'Email',
//     controller: emailController,
//     prefixIcon: Icons.email,
//     type: TextInputType.emailAddress),
