import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';

class CustomCircleIndicator extends StatelessWidget {
  final Color? color;
  const CustomCircleIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color ?? AppColors.offWhite,
    ));
  }
}
