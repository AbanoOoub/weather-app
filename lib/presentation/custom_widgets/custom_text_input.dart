import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/presentation/custom_widgets/def_text_form_field.dart';

import '../../data/models/app_colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {Key? key,
      required this.hint,
      required this.controller, this.onTapSuffixIcon,
      required this.prefixIcon, this.hideCharacters = false, this.suffixIcon,
      required this.type})
      : super(key: key);

  final String hint;
  final TextInputType type;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool hideCharacters;
  final VoidCallback? onTapSuffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: CustomTextForm(
            hint: hint,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: InkWell(onTap: onTapSuffixIcon,child: Icon(suffixIcon)),
            withBorders: false,
            hideCharacters: hideCharacters,
            controller: controller,
            hintColor: AppColors.secondColor,
            textColor: AppColors.secondColor,
            textInputType: type,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }),
      ),
    );
  }
}
