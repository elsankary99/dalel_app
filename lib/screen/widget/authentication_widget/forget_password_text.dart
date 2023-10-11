import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/router/app_router.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => context.router.replace(const ForgetPasswordRoute()),
          child: Text(
            AppStrings.forgotPassword,
            style: CustomTextStyles.pacifico600style12
                .copyWith(color: AppColors.brown),
          ),
        ),
      ],
    );
  }
}
