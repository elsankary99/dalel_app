import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/extension/media_query.dart';

class OtpVerificationWidget extends ConsumerWidget {
  const OtpVerificationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Pinput(
      onCompleted: (pin) => log(pin),
      defaultPinTheme: PinTheme(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: context.width * 0.17,
        height: context.height * 0.08,
        textStyle: TextStyle(
            fontSize: 24, color: AppColors.black, fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
