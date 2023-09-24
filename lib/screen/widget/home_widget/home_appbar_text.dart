import 'package:flutter/material.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';

class HomeAppBarText extends StatelessWidget {
  const HomeAppBarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style22,
        ),
      ),
    );
  }
}
