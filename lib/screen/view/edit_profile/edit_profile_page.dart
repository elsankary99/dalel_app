import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/edit_profile_widget/edit_profile_button.dart';
import 'package:test/screen/widget/edit_profile_widget/edit_profile_form.dart';
import 'package:test/screen/widget/edit_profile_widget/image_profilr.dart';

@RoutePage()
class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.editProfile,
          style: CustomTextStyles.poppins400style20,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(slivers: [
          const SliverToBoxAdapter(child: ImageProfile()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          const SliverToBoxAdapter(child: EditProfileForm()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.3)),
          SliverToBoxAdapter(
            child: EditProfileButton(onPressed: () {}),
          )
        ]),
      ),
    );
  }
}
