import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_txt_form.dart';
import 'package:test/screen/widget/authentication_widget/forget_password_body.dart';

@RoutePage()
class ForgetPasswordPage extends ConsumerWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(child: ForgetPasswordBody()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
            const SliverToBoxAdapter(
                child: CustomTextFormField(labelText: AppStrings.emailAddress)),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.12)),
            SliverToBoxAdapter(
                child: CustomButton(
                    text: AppStrings.sendVerificationCode,
                    onPressed: () {
                      context.router.push(const VerifyAccountRoute());
                    })),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          ]),
        ),
      ),
    );
  }
}