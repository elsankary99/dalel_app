import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/screen/widget/authentication_widget/Otp_verification_widget.dart';
import 'package:test/screen/widget/authentication_widget/resend_code_widget.dart';
import 'package:test/screen/widget/authentication_widget/verify_top_text.dart';

@RoutePage()
class VerifyAccountPage extends ConsumerWidget {
  const VerifyAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(child: VerifyTopTextCenter()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
            const SliverToBoxAdapter(child: OtpVerificationWidget()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
            SliverToBoxAdapter(child: ResendCodeWidget(onTap: () {})),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.28)),
            SliverToBoxAdapter(
                child: CustomButton(
                    text: AppStrings.verificationNow, onPressed: () {})),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          ]),
        ),
      ),
    );
  }
}
