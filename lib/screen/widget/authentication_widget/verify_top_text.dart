import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/authentication_widget/welcome_text.dart';

class VerifyTopTextCenter extends StatelessWidget {
  const VerifyTopTextCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.15),
        const WelcomeText(text: AppStrings.verifyAccount),
        SizedBox(height: context.height * 0.03),
        Text("${AppStrings.enter4DigitCodeWeHaveSentTo} elsankary54@gmail.com",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                CustomTextStyles.poppins400style12.copyWith(fontSize: 15.sp)),
      ],
    );
  }
}
