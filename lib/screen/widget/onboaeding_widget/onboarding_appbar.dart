import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/database/shared_pref_helper.dart';
import 'package:test/core/router/app_router.dart';

class OnBoardingAppBar extends ConsumerWidget {
  const OnBoardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () async {
            await ref
                .read(sharedPrefProvider)
                .saveData(key: "skipOnBoarding", value: true);
            context.router.replace(const SignUpRoute());
          },
          child: Text(AppStrings.skip,
              style: CustomTextStyles.poppins300style16
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 18.sp)),
        ),
      ],
    );
  }
}
