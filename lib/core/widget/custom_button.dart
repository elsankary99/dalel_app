import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: context.height * 0.07,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: AppColors.primaryColor),
            child: Text(
              text,
              style: CustomTextStyles.poppins500style24
                  .copyWith(fontSize: 18, color: AppColors.offWhite),
            )));
  }
}
