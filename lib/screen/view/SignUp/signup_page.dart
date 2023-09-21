import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_password_txt_field.dart';
import 'package:test/core/widget/custom_txt_form.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: context.height * 0.1),
            Text(
              AppStrings.welcome,
              textAlign: TextAlign.center,
              style: CustomTextStyles.pacifico600style28,
            ),
            SizedBox(height: context.height * 0.07),
            const CustomTextFormField(hintText: AppStrings.firstName),
            SizedBox(height: context.height * 0.04),
            const CustomTextFormField(hintText: AppStrings.lastName),
            SizedBox(height: context.height * 0.04),
            const CustomTextFormField(hintText: AppStrings.emailAddress),
            SizedBox(height: context.height * 0.04),
            const CustomPasswordTextFormField(hintText: AppStrings.password),
            SizedBox(height: context.height * 0.01),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text(
                  AppStrings.iHaveAgreeToOur,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.poppins500style24
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppStrings.termsAndCondition,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.poppins500style24.copyWith(
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.height * 0.07),
            const CustomButton(text: AppStrings.signUp),
            SizedBox(height: context.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.alreadyHaveAnAccount,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.poppins500style24.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.brown,
                      fontSize: 13.sp),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppStrings.signIn,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.poppins500style24.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightGrey,
                        fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.height * 0.01),
          ],
        ),
      )),
    );
  }
}
