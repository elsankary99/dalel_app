import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_circle_indicator.dart';
import 'package:test/provider/add_image_provider/add_image_provider.dart';
import 'package:test/screen/widget/home_widget/error_text.dart';

class UserInformationWidget extends ConsumerWidget {
  const UserInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getUserInfoProvider).when(
          error: (e, _) => ErrorText(error: e.toString()),
          loading: () => CustomCircleIndicator(
            color: AppColors.primaryColor,
          ),
          data: (data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      image: data!["image_url"] == null
                          ? null
                          : DecorationImage(
                              image: NetworkImage(data["image_url"])),
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data["first_name"] ?? ""} ${data["last_name"] ?? ""}",
                      style: CustomTextStyles.poppins500style18
                          .copyWith(color: AppColors.deepBrown),
                    ),
                    SizedBox(height: context.height * 0.01),
                    Text(FirebaseAuth.instance.currentUser!.email!,
                        style: CustomTextStyles.poppins500style16
                            .copyWith(color: AppColors.blackGrey))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.penToSquare,
                        color: AppColors.blackGrey))
              ],
            );
          },
        );
  }
}
