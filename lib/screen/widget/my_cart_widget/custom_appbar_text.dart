import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.myCart,
      style: CustomTextStyles.poppins500style18
          .copyWith(color: AppColors.deepBrown),
    );
  }
}
