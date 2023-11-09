import 'package:auto_route/auto_route.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_toast.dart';

@RoutePage()
class VerifyEmailPage extends ConsumerWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.envelopeOpen,
              size: 80.sp,
            ),
            SizedBox(height: context.height * 0.07),
            Text(
              AppStrings.verifyYourEmailAddress,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18
                  .copyWith(color: Colors.black),
            ),
            SizedBox(height: context.height * 0.02),
            Text(
              AppStrings.verifyYourEmailAddress2,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins400style14
                  .copyWith(color: AppColors.blackGrey),
            ),
            SizedBox(height: context.height * 0.02),
            Text(
              AppStrings.verifyYourEmailAddress3,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins400style14
                  .copyWith(color: AppColors.blackGrey),
            ),
            SizedBox(height: context.height * 0.05),
            SizedBox(
              height: context.height * 0.055,
              width: context.width * 0.4,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.currentUser!.reload();
                  if (FirebaseAuth.instance.currentUser!.emailVerified) {
                    router.replace(const InitialRoute());

                    customToast(title: AppStrings.welcomeToOurApp);
                  } else {
                    customToast(
                        title: "You Must Verify your Email First",
                        color: Colors.red);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).canvasColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.grey))),
                child: Text(
                  AppStrings.kContinue,
                  style: CustomTextStyles.poppins400style14
                      .copyWith(color: AppColors.blackGrey),
                ),
              ),
            ),
            SizedBox(height: context.height * 0.01),
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.currentUser!
                      .sendEmailVerification();
                  customToast(
                      title: "We send the verification link to your email");
                },
                child: const Text(
                  "Resend E-Mail Link",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            TextButton.icon(
                onPressed: () {
                  context.router.replace(const LoginRoute());
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  "back to login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
