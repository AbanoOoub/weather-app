import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/business_logic/login_logic/login_cubit.dart';
import 'package:weather_app/data/models/app_colors.dart';
import 'package:weather_app/presentation/custom_widgets/def_text_btn.dart';

import '../../data/constants/strings.dart';
import '../custom_widgets/custom_text_input.dart';
import '../custom_widgets/def_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
            if(state is LoginSuccessState){
              Navigator.pushNamedAndRemoveUntil(context, homeScreenRoute, (route) => false);
            }
          },
          builder: (context, state) {
            var loginCubit = LoginCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Form(
                  key: _loginFormKey,
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
                        text: 'Login',
                        textColor: AppColors.secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                      SizedBox(height: 10.h),
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
                            loginCubit.showOrHidePassword();
                          },
                          hideCharacters: loginCubit.showPass,
                          prefixIcon: Icons.lock,
                          suffixIcon: loginCubit.showPass
                              ? Icons.visibility_off
                              : Icons.visibility,
                          type: TextInputType.visiblePassword),
                      SizedBox(height: 30.h),
                      Center(
                        child: SizedBox(
                          width: 90.w,
                          height: 7.h,
                          child: state is LoginLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : CustomTextButtonWidget(
                              text: 'Login',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              textColor: AppColors.secondColor,
                              btnBackgroundColor: AppColors.white,
                              borderColor: AppColors.mainColor,
                              borderSize: 2,
                              hasBorder: true,
                              borderRadius: 10,
                              onPressed: () {
                                if (_loginFormKey.currentState!
                                    .validate()) {
                                  loginCubit.loginUser(email: emailController.text, password: passwordController.text);
                                }
                              }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Row(children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.secondColor,
                              height: 5.h,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: CustomTextWidget(
                                  text: 'or connect with',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColors.secondColor),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.secondColor,
                              height: 5.h,
                            ),
                          ),
                        ]),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Image.asset(
                                  appleImg,
                                  height: 10.w,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Image.asset(
                                  googleImg,
                                  height: 10.w,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Image.asset(
                                  facebookImg,
                                  height: 10.w,
                                )),
                          ]),
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
