import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/database/shared_pref_helper.dart';
import 'package:test/core/function/move_to_onboarding.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    final skipOnBoarding =
        ref.read(sharedPrefProvider).getData(key: "skipOnBoarding") ?? false;
    moveToOnBoarding(context, skipOnBoarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        AppStrings.appName,
        style: CustomTextStyles.pacifico400style64,
      ),
    ));
  }
}
