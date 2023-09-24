import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/screen/widget/authentication_widget/Otp_verification_widget.dart';
import 'package:test/screen/widget/authentication_widget/resend_code_widget.dart';
import 'package:test/screen/widget/authentication_widget/verify_top_text.dart';

@RoutePage()
class VerifyAccountPage extends ConsumerStatefulWidget {
  const VerifyAccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyAccountPageState();
}

class _VerifyAccountPageState extends ConsumerState<VerifyAccountPage> {
  late TextEditingController controller;
  bool isComplete = false;
  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      controller.length == 4 ? isComplete = true : isComplete = false;
      log("=***==$isComplete====");
      log("===${controller.length}==***==");
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(child: VerifyTopTextCenter()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
            SliverToBoxAdapter(
                child: OtpVerificationWidget(controller: controller)),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
            SliverToBoxAdapter(child: ResendCodeWidget(onTap: () {})),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.28)),
            SliverToBoxAdapter(
                child: CustomButton(
                    text: AppStrings.verificationNow,
                    onPressed: isComplete
                        ? () {
                            context.router.replace(const LoginRoute());
                          }
                        : null)),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          ]),
        ),
      ),
    );
  }
}
