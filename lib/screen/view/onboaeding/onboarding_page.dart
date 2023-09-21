import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/screen/widget/onboaeding_widget/onboarding_appbar.dart';
import 'package:test/screen/widget/onboaeding_widget/onboarding_indecator.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 30),
              const OnBoardingAppBar(),
              OnBoardingIndicator(controller: controller),
              const SizedBox(height: 40),
              const CustomButton(),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
