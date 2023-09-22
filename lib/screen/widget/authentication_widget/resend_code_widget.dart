import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';

class ResendCodeWidget extends StatelessWidget {
  final void Function()? onTap;
  const ResendCodeWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.haventReceivedVerificationCode,
            textAlign: TextAlign.center,
            style:
                CustomTextStyles.poppins400style12.copyWith(fontSize: 14.sp)),
        InkWell(
          onTap: onTap,
          child: Text(AppStrings.resendCode,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins400style12.copyWith(
                  fontSize: 16.sp, decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
