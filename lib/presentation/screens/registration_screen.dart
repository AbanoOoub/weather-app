import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/business_logic/register_logic/register_cubit.dart';
import 'package:weather_app/data/constants/strings.dart';
import 'package:weather_app/presentation/custom_widgets/custom_text_input.dart';
import 'package:weather_app/presentation/custom_widgets/def_text_btn.dart';

import '../../data/models/app_colors.dart';
import '../custom_widgets/def_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is RegisterSuccessState) {
              Navigator.pushReplacementNamed(
                  context,
                  loginScreenRoute);
            }
          },
          builder: (context, state) {
            var registerCubit = RegisterCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Form(
                  key: _registerFormKey,
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
                        text: 'Registration',
                        textColor: AppColors.secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextInput(
                          controller: fullNameController,
                          hint: 'Enter Full Name',
                          prefixIcon: Icons.person,
                          type: TextInputType.text),
                      SizedBox(height: 2.h),
                      CustomTextInput(
                          controller: emailController,
                          hint: 'Enter Email',
                          prefixIcon: Icons.email,
                          type: TextInputType.emailAddress),
                      SizedBox(height: 2.h),
                      CustomTextInput(
                          controller: passwordController,
                          hint: 'Enter Password',
                          onTapSuffixIcon: () {
                            registerCubit.showOrHidePassword();
                          },
                          hideCharacters: registerCubit.showPass,
                          prefixIcon: Icons.lock,
                          suffixIcon: registerCubit.showPass
                              ? Icons.visibility_off
                              : Icons.visibility,
                          type: TextInputType.visiblePassword),
                      SizedBox(height: 30.h),
                      Center(
                        child: SizedBox(
                          width: 90.w,
                          height: 7.h,
                          child: state is RegisterLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : CustomTextButtonWidget(
                                  text: 'Sign up',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                  textColor: AppColors.secondColor,
                                  btnBackgroundColor: AppColors.white,
                                  borderColor: AppColors.mainColor,
                                  borderSize: 2,
                                  hasBorder: true,
                                  borderRadius: 10,
                                  onPressed: () {
                                    if (_registerFormKey.currentState!
                                        .validate()) {
                                      registerCubit.registerNewUser(
                                          name: fullNameController.text,
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                              text: 'Already have an account?',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              textColor: AppColors.secondColor),
                          CustomTextButtonWidget(
                              text: 'Login Here',
                              textColor: Colors.blueGrey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w200,
                              btnBackgroundColor: Colors.transparent,
                              hasBorder: false,
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, loginScreenRoute);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
