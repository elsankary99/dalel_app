import 'package:flutter/material.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';

class OnBoardingAppBar extends StatelessWidget {
  const OnBoardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(AppStrings.skip,
              style: CustomTextStyles.poppins300style16
                  .copyWith(fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
