import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/extension/media_query.dart';

class OtpVerificationWidget extends ConsumerWidget {
  const OtpVerificationWidget({this.controller, super.key});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: context.width * 0.17,
      height: context.height * 0.08,
      textStyle: TextStyle(
          fontSize: 24, color: AppColors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.deepGrey),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryColor),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryColor),
    );

    return Pinput(
      controller: controller,
      onCompleted: (pin) => log(pin),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: true,
      //  focusedPinTheme:  ,
    );
  }
}
