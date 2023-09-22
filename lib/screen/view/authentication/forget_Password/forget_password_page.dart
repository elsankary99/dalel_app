import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_txt_form.dart';
import 'package:test/screen/widget/authentication_widget/welcome_text.dart';

@RoutePage()
class ForgetPasswordPage extends ConsumerWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          const SliverToBoxAdapter(
              child: WelcomeText(text: AppStrings.forgotPass)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          SliverToBoxAdapter(
            child: SizedBox(
                height: context.height * 0.35,
                child: Image.asset(Assets.assetsImagesForgotPassword)),
          ),
          SliverToBoxAdapter(
              child: Text(AppStrings.enterYourRegisteredEmail,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.poppins400style12
                      .copyWith(fontSize: 13.sp))),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
          const SliverToBoxAdapter(
              child: CustomTextFormField(labelText: AppStrings.emailAddress)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.12)),
          SliverToBoxAdapter(
              child: CustomButton(
                  text: AppStrings.sendVerificationCode, onPressed: () {})),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        ]),
      ),
    );
  }
}
