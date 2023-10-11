import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class LoginBarWidget extends StatelessWidget {
  const LoginBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.32,
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppStrings.appName,
            textAlign: TextAlign.center,
            style: CustomTextStyles.saira700style32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                Assets.assetsImagesVector1,
                fit: BoxFit.fill,
              ),
              SvgPicture.asset(
                Assets.assetsImagesVector2,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
