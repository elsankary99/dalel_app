import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_circle_indicator.dart';
import 'package:test/core/widget/custom_toast.dart';
import 'package:test/provider/auth_provider/auth_provider.dart';
import 'package:test/screen/widget/authentication_widget/custom_login_form.dart';
import 'package:test/screen/widget/authentication_widget/forget_password_text.dart';
import 'package:test/screen/widget/authentication_widget/have_account_or_not.dart';
import 'package:test/screen/widget/authentication_widget/svg_images_widget.dart';
import 'package:test/screen/widget/authentication_widget/welcome_text.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(authProvider.notifier);
    final state = ref.watch(authProvider);
    ref.listen(
      authProvider,
      (previous, next) {
        if (next is LoginFailure) {
          customToast(title: next.message, color: Colors.red);
        }
        if (next is LoginSuccess) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            context.router.replace(const InitialRoute());
            customToast(title: AppStrings.welcomeLBack);
          } else {
            context.router.replace(const VerifyEmailRoute());
          }
        }
      },
    );

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: LoginBarWidget(),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              SizedBox(height: context.height * 0.05),
              const WelcomeText(text: AppStrings.welcomeBack),
              const CustomLoginForm(),
              const ForgetPasswordText(),
              SizedBox(height: context.height * 0.07),
              CustomButton(
                  text: AppStrings.signIn,
                  onPressed: () async {
                    await provider.login();
                  },
                  child: state is LoginLoading
                      ? const CustomCircleIndicator()
                      : null),
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
