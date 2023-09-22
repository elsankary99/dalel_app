import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/screen/widget/signup_widget/function.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  final String hintText;
  const CustomPasswordTextFormField({
    super.key,
    required this.hintText,
  });

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool isHide = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: TextFormField(
        obscureText: isHide,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            suffixIconColor: isHide ? AppColors.grey : AppColors.primaryColor,
            suffixIcon: GestureDetector(
              child: Icon(
                isHide ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              ),
              onTap: () {
                setState(() {
                  isHide = !isHide;
                });
              },
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            border: const OutlineInputBorder(),
            focusedBorder: outlineInputBorder(AppColors.primaryColor),
            enabledBorder: outlineInputBorder(AppColors.grey),
            labelStyle: CustomTextStyles.poppins500style12,
            labelText: widget.hintText),
      ),
    );
  }
}
