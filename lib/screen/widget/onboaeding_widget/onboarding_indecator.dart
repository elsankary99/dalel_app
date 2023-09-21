import 'package:flutter/material.dart';
import 'package:test/data/model/onboarding_model/onboarding_model.dart';
import 'package:test/screen/widget/onboaeding_widget/onBoarding_body.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({
    super.key,
    required this.controller,
    this.onPageChanged,
  });
  final void Function(int)? onPageChanged;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: onboardingList.length,
        itemBuilder: (context, index) {
          return OnBoardingBody(
            index: index,
            controller: controller,
            data: onboardingList[index],
          );
        },
      ),
    );
  }
}
