import 'package:flutter/material.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
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
        SizedBox(height: context.height * 0.08),
        SizedBox(
            height: context.height * 0.3,
            width: context.width * 0.75,
            child: Image.asset(data.image, fit: BoxFit.fill)),
        SizedBox(height: context.width * 0.05),
        CustomSmoothPageIndicator(controller: controller),
        SizedBox(height: context.width * 0.05),
        Text(data.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.poppins500style24),
        SizedBox(height: context.width * 0.02),
        Text(data.subTitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.poppins300style16),
      ],
    );
  }
}
