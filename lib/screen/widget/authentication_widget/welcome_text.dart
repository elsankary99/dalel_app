import 'package:flutter/material.dart';
import 'package:test/core/constant/app_text_style.dart';

class WelcomeText extends StatelessWidget {
  final String text;
  const WelcomeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: CustomTextStyles.pacifico600style28,
    );
  }
}
