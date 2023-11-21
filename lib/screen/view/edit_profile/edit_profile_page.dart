import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_circle_indicator.dart';
import 'package:test/core/widget/custom_toast.dart';
import 'package:test/provider/add_image_provider/add_image_provider.dart';
import 'package:test/screen/widget/edit_profile_widget/edit_profile_button.dart';
import 'package:test/screen/widget/edit_profile_widget/edit_profile_form.dart';
import 'package:test/screen/widget/edit_profile_widget/image_profilr.dart';
import 'package:test/screen/widget/home_widget/error_text.dart';

@RoutePage()
class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addImageProvider);
    final provider = ref.read(addImageProvider.notifier);
    ref.listen(addImageProvider, (p, c) {
      if (c is EditProfileSuccess) {
        ref.invalidate(getUserInfoProvider);
        customToast(title: "Your Profile Edited Successfully");
      }
      if (c is EditProfileError) {
        customToast(title: c.message, color: Colors.red);
      }
    });

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
        body: ref.watch(getUserInfoProvider).when(
              error: (e, _) => ErrorText(error: e.toString()),
              loading: () => CustomCircleIndicator(
                color: AppColors.primaryColor,
              ),
              data: (data) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                        child: SizedBox(height: context.height * 0.02)),
                    SliverToBoxAdapter(
                        child: ImageProfile(
                      imageUrl: data!["image_url"],
                    )),
                    SliverToBoxAdapter(
                        child: SizedBox(height: context.height * 0.02)),
                    SliverToBoxAdapter(
                        child: EditProfileForm(
                      firstName: data["first_name"] ?? "",
                      lastName: data["last_name"] ?? "",
                    )),
                    SliverToBoxAdapter(
                        child: SizedBox(height: context.height * 0.3)),
                    SliverToBoxAdapter(
                      child: state is EditProfileLoading
                          ? CustomCircleIndicator(
                              color: AppColors.primaryColor,
                            )
                          : EditProfileButton(onPressed: () async {
                              await provider.editUserProfile();
                            }),
                    ),
                    SliverToBoxAdapter(
                        child: SizedBox(height: context.height * 0.05)),
                  ]),
                );

                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: 55,
                //       width: 55,
                //       decoration: BoxDecoration(
                //           image: data!["image_url"] == null
                //               ? null
                //               : DecorationImage(
                //                   image: NetworkImage(data["image_url"])),
                //           color: AppColors.primaryColor,
                //           shape: BoxShape.circle),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "${data["first_name"] ?? ""} ${data["last_name"] ?? ""}",
                //           style: CustomTextStyles.poppins500style18
                //               .copyWith(color: AppColors.deepBrown),
                //         ),
                //         SizedBox(height: context.height * 0.01),
                //         Text(FirebaseAuth.instance.currentUser!.email!,
                //             style: CustomTextStyles.poppins500style16
                //                 .copyWith(color: AppColors.blackGrey))
                //       ],
                //     ),
                //     IconButton(
                //         onPressed: () {},
                //         icon: Icon(FontAwesomeIcons.penToSquare,
                //             color: AppColors.blackGrey))
                //   ],
                // );
              },
            ));
  }
}
