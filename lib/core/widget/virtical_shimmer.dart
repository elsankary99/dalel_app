import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/extension/media_query.dart';

class VerticalShimmer extends StatelessWidget {
  const VerticalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.24,
      child: Shimmer.fromColors(
          baseColor: AppColors.primaryColor.withOpacity(0.5),
          highlightColor: AppColors.primaryColor.withOpacity(0.1),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: AppColors.primaryColor, blurRadius: 2)
                ]),
          )),
    );
  }
}
