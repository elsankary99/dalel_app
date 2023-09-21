import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/data/model/onboarding_model/onboarding_model.dart';

class OnBoardingBody extends StatelessWidget {
  final PageController controller;
  final OnBoardingModel data;
  final int index;
  const OnBoardingBody(
      {super.key,
      required this.controller,
      required this.data,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 42),
        Container(
          height: 270,
          width: 278,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(data.image), fit: BoxFit.fill)),
        ),
        const SizedBox(height: 34),
        SmoothPageIndicator(
          controller: controller, // PageController
          count: onboardingList.length,

          effect: ExpandingDotsEffect(
              activeDotColor: AppColors.deebBrown,
              dotHeight: 6,
              dotWidth: 8), // your preferred effect
        ),
        const SizedBox(height: 32),
        Text(data.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.poppins500style24),
        const SizedBox(height: 16),
        Text(data.subTitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.poppins300style16),
      ],
    );
  }
}
