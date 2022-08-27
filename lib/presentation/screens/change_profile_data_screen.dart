import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/business_logic/profile_logic/profile_cubit.dart';
import 'package:weather_app/data/constants/strings.dart';
import 'package:weather_app/data/helpers/toast_message.dart';
import 'package:weather_app/presentation/custom_widgets/def_text.dart';

import '../../data/models/app_colors.dart';
import '../custom_widgets/custom_text_input.dart';
import '../custom_widgets/def_text_btn.dart';

class ChangeProfileDataScreen extends StatelessWidget {
  ChangeProfileDataScreen({Key? key}) : super(key: key);

  final TextEditingController newNameController = TextEditingController();
  final TextEditingController newEmailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newCountryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is UpdateSuccessState) {
            toast(msg: 'Data Updated Please Login Again');
            Navigator.pushNamedAndRemoveUntil(
                context, startScreenRoute, (route) => false);
          }
        },
        builder: (context, state) {
          var profileCubit = ProfileCubit.get(context);
          return Scaffold(
            body:
             SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        child: const Icon(Icons.arrow_back_rounded),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(height: 5.h),
                    CustomTextWidget(
                      text: 'change in Fields that you need to update',
                      textColor: AppColors.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextInput(
                        controller: newNameController,
                        hint: 'Enter new name',
                        prefixIcon: Icons.person,
                        type: TextInputType.text),
                    SizedBox(height: 2.h),
                    CustomTextInput(
                        controller: newEmailController,
                        hint: 'Enter new email',
                        prefixIcon: Icons.email,
                        type: TextInputType.emailAddress),
                    SizedBox(height: 2.h),
                    CustomTextInput(
                        controller: newPasswordController,
                        hint: 'Enter new Password',
                        onTapSuffixIcon: () {
                          profileCubit.showOrHidePassword();
                        },
                        hideCharacters: profileCubit.showPass,
                        prefixIcon: Icons.lock,
                        suffixIcon: profileCubit.showPass
                            ? Icons.visibility_off
                            : Icons.visibility,
                        type: TextInputType.visiblePassword),
                    SizedBox(height: 2.h),
                    CustomTextInput(
                        controller: newCountryController,
                        hint: 'Enter your country',
                        prefixIcon: Icons.location_on,
                        type: TextInputType.text),
                    SizedBox(height: 25.h),
                    Center(
                      child: SizedBox(
                        width: 90.w,
                        height: 7.h,
                        child: state is UpdateLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : CustomTextButtonWidget(
                            text: 'Save',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            textColor: AppColors.secondColor,
                            btnBackgroundColor: AppColors.white,
                            borderColor: AppColors.mainColor,
                            borderSize: 2,
                            hasBorder: true,
                            borderRadius: 10,
                            onPressed: () {
                              profileCubit.updateProfileData(
                                  newName: newNameController.text,
                                  newEmail: newEmailController.text,
                                  newPassword: newPasswordController.text,
                                  newLocation: newCountryController.text);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
