import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';

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
    return TextFormField(
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
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
          hintText: widget.hintText,
          labelStyle: CustomTextStyles.poppins300style16.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.deebGrey,
              fontSize: 16.sp),
          hintStyle: CustomTextStyles.poppins300style16.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
          labelText: widget.hintText),
    );
  }
}
