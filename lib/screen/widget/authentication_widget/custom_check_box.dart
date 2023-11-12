import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/provider/auth_provider/auth_provider.dart';

class CustomCheckBox extends ConsumerWidget {
  const CustomCheckBox({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authProvider);
    final provider = ref.read(authProvider.notifier);
    return Checkbox(
        value: provider.activeTerms,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        activeColor: AppColors.primaryColor,
        onChanged: (value) {
          provider.termsAndCondition(value!);
        });
  }
}
