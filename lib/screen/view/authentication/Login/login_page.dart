import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_password_txt_field.dart';
import 'package:test/core/widget/custom_txt_form.dart';
import 'package:test/screen/widget/authentication_widget/forget_password_text.dart';
import 'package:test/screen/widget/authentication_widget/have_account_or_not.dart';
import 'package:test/screen/widget/authentication_widget/svg_images_widget.dart';
import 'package:test/screen/widget/authentication_widget/welcome_text.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: context.height * 0.3,
            backgroundColor: AppColors.primaryColor,
            bottom: const PreferredSize(
              preferredSize: Size.zero,
              child: SvgImagesWidget(),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              SizedBox(height: context.height * 0.05),
              const WelcomeText(text: AppStrings.welcomeBack),
              SizedBox(height: context.height * 0.04),
              const CustomTextFormField(labelText: AppStrings.emailAddress),
              const CustomPasswordTextFormField(hintText: AppStrings.password),
              SizedBox(height: context.height * 0.02),
              const ForgetPasswordText(),
              SizedBox(height: context.height * 0.07),
              CustomButton(
                  text: AppStrings.signIn,
                  onPressed: () {
                    context.router.replace(const InitialRoute());
                  }),
              SizedBox(height: context.height * 0.02),
              HaveAccountOrNot(
                  onTap: () => context.router.replace(const SignUpRoute()),
                  text1: AppStrings.dontHaveAnAccount,
                  text2: AppStrings.signUp),
              SizedBox(height: context.height * 0.01),
            ]),
          )),
        ],
      ),
    );
  }
}
