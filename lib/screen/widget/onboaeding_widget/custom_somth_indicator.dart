import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/data/model/onboarding_model/onboarding_model.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller, // PageController
      count: onboardingList.length,

      effect: ExpandingDotsEffect(
          activeDotColor: AppColors.deepBrown,
          dotHeight: 6,
          dotWidth: 8), // your preferred effect
    );
  }
}
