import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_password_txt_field.dart';
import 'package:test/core/widget/custom_txt_form.dart';
import 'package:test/provider/auth_provider/auth_provider.dart';

class CustomLoginForm extends ConsumerWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(authProvider.notifier);
    return Form(
      key: provider.loginKey,
      child: Column(children: [
        SizedBox(height: context.height * 0.04),
        CustomTextFormField(
            onChanged: (emailAddress) {
              provider.emailAddress = emailAddress;
            },
            labelText: AppStrings.emailAddress),
        CustomPasswordTextFormField(
            onChanged: (password) {
              provider.password = password;
            },
            hintText: AppStrings.password),
        SizedBox(height: context.height * 0.02),
      ]),
    );
  }
}
