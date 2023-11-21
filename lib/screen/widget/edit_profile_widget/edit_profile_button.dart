import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.height * 0.07,
      child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
          onPressed: onPressed,
          child: Text(
            AppStrings.editProfile,
            style: CustomTextStyles.poppins500style14.copyWith(
                color: AppColors.offWhite, fontWeight: FontWeight.w600),
          )),
    );
  }
}
