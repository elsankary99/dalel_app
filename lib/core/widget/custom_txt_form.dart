import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/screen/widget/authentication_widget/function.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onSaved,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.trim().isEmpty) {
            return AppStrings.requiredField;
          }
          return null;
        },
        onChanged: onChanged,
        onSaved: onSaved,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            border: const OutlineInputBorder(),
            focusedBorder: outlineInputBorder(AppColors.primaryColor),
            enabledBorder: outlineInputBorder(AppColors.grey),
            labelStyle: CustomTextStyles.poppins500style12,
            labelText: labelText),
      ),
    );
  }
}
