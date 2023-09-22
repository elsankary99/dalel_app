import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/authentication_widget/welcome_text.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.075),
        const WelcomeText(text: AppStrings.forgotPass),
        SizedBox(height: context.height * 0.03),
        SizedBox(
            height: context.height * 0.35,
            child: Image.asset(Assets.assetsImagesForgotPassword)),
        Text(AppStrings.enterYourRegisteredEmail,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.poppins400style12.copyWith(fontSize: 13.sp))
      ],
    );
  }
}
