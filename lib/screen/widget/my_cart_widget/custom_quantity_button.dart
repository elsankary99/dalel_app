import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/extension/media_query.dart';

class CustomQuantityButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final IconData? icon;
  const CustomQuantityButton({super.key, this.onTap, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.05,
        width: context.width * 0.05,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(
          icon,
          size: 10.sp,
          color: AppColors.offWhite,
        ),
      ),
    );
  }
}
