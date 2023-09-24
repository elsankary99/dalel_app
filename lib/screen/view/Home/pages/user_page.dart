import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/home_widget/user_information_widget.dart';
import 'package:test/screen/widget/home_widget/user_setting_widget.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: UserInformationWidget()),
        SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
        SliverToBoxAdapter(
            child: Text(AppStrings.account,
                style: CustomTextStyles.poppins500style16
                    .copyWith(color: AppColors.blackGrey))),
        SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        const SliverToBoxAdapter(
            child: UserSettingWidget(
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
        const SliverToBoxAdapter(
            child: UserSettingWidget(
                text: AppStrings.logOut,
                icon: FontAwesomeIcons.rightFromBracket)),
      ],
    );
  }
}
