import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';

@RoutePage()
class OrderSuccessPage extends ConsumerWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: context.height * 0.08),
            SizedBox(
                width: context.width * 0.7,
                child: Image.asset(Assets.assetsImagesSucccesOrder)),
            SizedBox(height: context.height * 0.02),
            Text(
              AppStrings.orderSuccess,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style24
                  .copyWith(color: AppColors.deepBrown),
            ),
            SizedBox(height: context.height * 0.01),
            Text(
              AppStrings.thanksForOrder,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins400style14
                  .copyWith(color: AppColors.blackGrey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: context.height * 0.07,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                  onPressed: () {
                    context.router.replaceAll([const InitialRoute()]);
                  },
                  child: Text(
                    AppStrings.backToHome,
                    style: CustomTextStyles.poppins500style14.copyWith(
                        color: AppColors.offWhite, fontWeight: FontWeight.w600),
                  )),
            ),
            SizedBox(height: context.height * 0.035),
          ],
        ),
      ),
    );
  }
}
