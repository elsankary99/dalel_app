import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/onboaeding_widget/last_onboarding_btn.dart';
import 'package:test/screen/widget/onboaeding_widget/onboarding_appbar.dart';
import 'package:test/screen/widget/onboaeding_widget/onboarding_indecator.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: context.height * 0.035),
              const OnBoardingAppBar(),
              OnBoardingIndicator(
                controller: controller,
                onPageChanged: (index) {
                  currentIndex = index;
                  setState(() {});
                },
              ),
              LastOnBoardingButton(
                  controller: controller, currentIndex: currentIndex)
            ],
          ),
        ),
      ),
    );
  }
}
