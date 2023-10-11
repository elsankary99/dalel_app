import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/core/router/app_router.dart';

moveToOnBoarding(BuildContext context, bool skipOnBoarding) {
  Future.delayed(
    const Duration(seconds: 2),
    () {
      if (FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser!.emailVerified) {
        context.router.replace(const InitialRoute());
      } else {
        context.router.replace(
            skipOnBoarding ? const LoginRoute() : const OnBoardingRoute());
      }
    },
  );
}
