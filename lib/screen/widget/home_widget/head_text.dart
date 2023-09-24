import 'package:flutter/material.dart';
import 'package:test/core/constant/app_text_style.dart';

class HeadText extends StatelessWidget {
  const HeadText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyles.poppins400style20,
    );
  }
}
