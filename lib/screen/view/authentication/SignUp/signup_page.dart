import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/screen/widget/authentication_widget/custom_signup_form.dart';
import 'package:test/screen/widget/authentication_widget/have_account_or_not.dart';
import 'package:test/screen/widget/authentication_widget/welcome_text.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.13)),
            const SliverToBoxAdapter(
                child: WelcomeText(text: AppStrings.welcome)),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.04)),
            const SliverToBoxAdapter(child: CustomSignUPForm()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
            SliverToBoxAdapter(
              child: HaveAccountOrNot(
                  onTap: () => context.router.replace(const LoginRoute()),
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signIn),
            ),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.01)),
          ],
        ),
      )),
    );
  }
}
