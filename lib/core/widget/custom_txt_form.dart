import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  const CustomTextFormField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
          hintText: hintText,
          labelStyle: CustomTextStyles.poppins300style16.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.deebGrey,
              fontSize: 16.sp),
          hintStyle: CustomTextStyles.poppins300style16.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
          labelText: hintText),
    );
  }
}
