import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_password_txt_field.dart';
import 'package:test/core/widget/custom_txt_form.dart';
import 'package:test/provider/authentication/signup_provider/sign_up_provider.dart';
import 'package:test/screen/widget/authentication_widget/terms_and_condition.dart';

class CustomSignUPForm extends ConsumerWidget {
  const CustomSignUPForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(authProvider.notifier);
    ref.watch(authProvider);
    return Form(
      key: provider.signUpKey,
      child: Column(
        children: [
          CustomTextFormField(
              onChanged: (firstName) {
                provider.firstName = firstName;
              },
              labelText: AppStrings.firstName),
          CustomTextFormField(
              onChanged: (lastName) {
                provider.lastName = lastName;
              },
              labelText: AppStrings.lastName),
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
          SizedBox(height: context.height * 0.01),
          const TermsAndConditionWidget(),
          SizedBox(height: context.height * 0.07),
          CustomButton(
              text: AppStrings.signUp,
              onPressed: provider.activeTerms
                  ? () async {
                      await provider.signUpWithEmailAndPassword();
                    }
                  : null)
        ],
      ),
    );
  }
}
