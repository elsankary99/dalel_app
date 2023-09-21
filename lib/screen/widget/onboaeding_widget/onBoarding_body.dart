import 'package:flutter/material.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/data/model/onboarding_model/onboarding_model.dart';
import 'package:test/screen/widget/onboaeding_widget/custom_somth_indicator.dart';

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
        CustomSmoothPageIndicator(controller: controller),
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
