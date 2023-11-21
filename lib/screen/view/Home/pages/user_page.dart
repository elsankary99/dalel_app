import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/custom_circle_indicator.dart';
import 'package:test/core/widget/custom_dialog.dart';
import 'package:test/core/widget/custom_toast.dart';
import 'package:test/provider/auth_provider/auth_provider.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';
import 'package:test/screen/widget/home_widget/user_information_widget.dart';
import 'package:test/screen/widget/home_widget/user_setting_widget.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(authProvider.notifier);
    final state = ref.watch(authProvider);
    ref.listen(
      authProvider,
      (previous, next) {
        if (next is LogOutFailure) {
          customToast(title: next.message, color: Colors.red);
        }
        if (next is LogOutSuccess) {
          context.router.replace(const LoginRoute());
          customToast(title: "SignOut Successfully");
        }
      },
    );
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Icon(
            FontAwesomeIcons.gripLines,
            color: AppColors.deepBrown,
          ),
          // title: Image.asset(Assets.assetsImagesPyramid),
          backgroundColor: Colors.transparent,
          actions: const [HomeAppBarText()],
        ),
        const SliverToBoxAdapter(child: UserInformationWidget()),
        SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
        SliverToBoxAdapter(
            child: Text(AppStrings.account,
                style: CustomTextStyles.poppins500style16
                    .copyWith(color: AppColors.blackGrey))),
        SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        SliverToBoxAdapter(
            child: UserSettingWidget(
                onTap: () {
                  context.router.push(const EditProfileRoute());
                },
                text: AppStrings.editProfile,
                icon: FontAwesomeIcons.solidUser)),
        const SliverToBoxAdapter(
            child: UserSettingWidget(
                text: AppStrings.notification,
                icon: FontAwesomeIcons.solidBell)),
        SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        SliverToBoxAdapter(
            child: Text(AppStrings.general,
                style: CustomTextStyles.poppins500style16
                    .copyWith(color: AppColors.blackGrey))),
        SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
        const SliverToBoxAdapter(
            child: UserSettingWidget(
                text: AppStrings.settings, icon: FontAwesomeIcons.gear)),
        const SliverToBoxAdapter(
            child:
                UserSettingWidget(text: AppStrings.security, icon: Icons.lock)),
        const SliverToBoxAdapter(
            child: UserSettingWidget(
                text: AppStrings.privacyPolicy, icon: Icons.privacy_tip_sharp)),
        SliverToBoxAdapter(
            child: UserSettingWidget(
                onTap: () {
                  showMyDialog(context, onPressed: () async {
                    await provider.logOut();
                  },
                      child: state is LogOutLoading
                          ? const CustomCircleIndicator()
                          : null,
                      header: AppStrings.logOut,
                      btnTitle: AppStrings.logOut,
                      title: AppStrings.sureLogOut);
                },
                text: AppStrings.logOut,
                icon: FontAwesomeIcons.rightFromBracket)),
      ],
    );
  }
}
