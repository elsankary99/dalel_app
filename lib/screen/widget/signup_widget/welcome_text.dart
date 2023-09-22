import 'package:flutter/material.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.13),
        Text(
          AppStrings.welcome,
          textAlign: TextAlign.center,
          style: CustomTextStyles.pacifico600style28,
        ),
      ],
    );
  }
}
