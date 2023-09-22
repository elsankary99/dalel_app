import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/database/shared_pref_helper.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/data/model/onboarding_model/onboarding_model.dart';

class LastOnBoardingButton extends ConsumerWidget {
  const LastOnBoardingButton(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return currentIndex != onboardingList.length - 1
        ? Column(
            children: [
              SizedBox(height: context.height * 0.1),
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
            SizedBox(height: context.height * 0.06),
            CustomButton(
                text: AppStrings.createAccount,
                onPressed: () async {
                  await ref
                      .read(sharedPrefProvider)
                      .saveData(key: "skipOnBoarding", value: true);
                  context.router.replace(const SignUpRoute());
                }),
            SizedBox(height: context.height * 0.01),
            GestureDetector(
              onTap: () async {
                await ref
                    .read(sharedPrefProvider)
                    .saveData(key: "skipOnBoarding ", value: true);
                context.router.replace(const LoginRoute());
              },
              child: Text(AppStrings.loginNow,
                  style: CustomTextStyles.poppins300style16.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: AppColors.deepBrown,
                    decoration: TextDecoration.underline,
                  )),
            ),
            SizedBox(height: context.height * 0.005),
          ]);
  }
}
