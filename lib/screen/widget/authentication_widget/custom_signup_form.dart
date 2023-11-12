import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_circle_indicator.dart';
import 'package:test/core/widget/custom_password_txt_field.dart';
import 'package:test/core/widget/custom_toast.dart';
import 'package:test/core/widget/custom_txt_form.dart';
import 'package:test/provider/auth_provider/auth_provider.dart';
import 'package:test/screen/widget/authentication_widget/terms_and_condition.dart';

class CustomSignUPForm extends ConsumerWidget {
  const CustomSignUPForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(authProvider.notifier);
    final state = ref.watch(authProvider);
    ref.listen(
      authProvider,
      (previous, next) {
        if (next is SignUpFailure) {
          customToast(title: next.message, color: Colors.red);
        }
        if (next is SignUpSuccess) {
          context.router.replace(const VerifyEmailRoute());
          customToast(title: AppStrings.accountCreatedSuccessfully);
        }
      },
    );
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
                      // log("${FirebaseAuth.instance.currentUser?.emailVerified}===+");
                      await provider.signUpWithEmailAndPassword();
                    }
                  : null,
              child:
                  state is SignUpLoading ? const CustomCircleIndicator() : null)
        ],
      ),
    );
  }
}
