import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/data/model/onboarding_model/onboarding_model.dart';

class LastOnBoardingButton extends StatelessWidget {
  const LastOnBoardingButton(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return currentIndex != onboardingList.length - 1
        ? Column(
            children: [
              const SizedBox(height: 40),
              CustomButton(
                  text: AppStrings.next,
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }),
            ],
          )
        : Column(children: [
            const SizedBox(height: 16),
            CustomButton(
                text: AppStrings.createAccount,
                onPressed: () => context.router.replace(const SignUpRoute())),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => context.router.replace(const LoginRoute()),
              child: Text(AppStrings.loginNow,
                  style: CustomTextStyles.poppins300style16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.deebBrown,
                    decoration: TextDecoration.underline,
                  )),
            ),
            const SizedBox(height: 7),
          ]);
  }
}
