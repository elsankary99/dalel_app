import 'package:flutter/material.dart';
import 'package:test/core/constant/app_text_style.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ),
          Text(
            error,
            style: CustomTextStyles.poppins500style16.copyWith(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
