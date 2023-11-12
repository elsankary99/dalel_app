import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_circle_indicator.dart';
import 'package:test/core/widget/custom_toast.dart';
import 'package:test/core/widget/custom_txt_form.dart';
import 'package:test/provider/auth_provider/auth_provider.dart';
import 'package:test/screen/widget/authentication_widget/forget_password_body.dart';

@RoutePage()
class ForgetPasswordPage extends ConsumerWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(authProvider.notifier);
    final state = ref.watch(authProvider);
    ref.listen(
      authProvider,
      (previous, next) {
        if (next is ResetPasswordFailure) {
          customToast(title: next.message, color: Colors.red);
        }
        if (next is ResetPasswordSuccess) {
          context.router.replace(const LoginRoute());
          customToast(title: "Check Your E-mail To Reset Password");
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(child: ForgetPasswordBody()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
            SliverToBoxAdapter(
                child: Form(
              key: provider.resetPasswordKey,
              child: CustomTextFormField(
                  onChanged: (emailAddress) {
                    provider.emailAddress = emailAddress;
                  },
                  labelText: AppStrings.emailAddress),
            )),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.12)),
            SliverToBoxAdapter(
                child: CustomButton(
                    text: AppStrings.sendResetPasswordLink,
                    onPressed: () async {
                      await provider.resetPassword();
                    },
                    child: state is ResetPasswordLoading
                        ? const CustomCircleIndicator()
                        : null)),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          ]),
        ),
      ),
    );
  }
}
