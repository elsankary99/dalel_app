import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class UserSettingWidget extends StatelessWidget {
  const UserSettingWidget({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
  });
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: AppColors.deepBrown.withOpacity(0.2)))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    icon,
                    color: AppColors.deepBrown,
                    size: 21.sp,
                  ),
                  SizedBox(
                    width: context.width * 0.1,
                  ),
                  Text(
                    text,
                    style: CustomTextStyles.poppins500style16.copyWith(
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
              Icon(FontAwesomeIcons.angleRight, color: AppColors.brown),
            ]),
      ),
    );
  }
}
