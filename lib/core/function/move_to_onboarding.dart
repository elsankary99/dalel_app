import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/core/router/app_router.dart';

moveToOnBoarding(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 2),
    () {
      context.router.replace(const OnBoardingRoute());
    },
  );
}
