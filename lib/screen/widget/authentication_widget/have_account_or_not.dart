import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';

class HaveAccountOrNot extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const HaveAccountOrNot({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          textAlign: TextAlign.center,
          style: CustomTextStyles.poppins500style24.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.brown,
              fontSize: 13.sp),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: CustomTextStyles.poppins400style12.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}
