import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.height * 0.25,
              width: context.width * 0.25,
              child: Image.asset(Assets.assetsImagesForgotPassword,
                  fit: BoxFit.fill),
            ),
          )
        ]),
      ),
    );
  }
}
