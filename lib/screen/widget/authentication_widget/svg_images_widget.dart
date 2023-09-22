import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class SvgImagesWidget extends StatelessWidget {
  const SvgImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            SizedBox(
              height: context.height * 0.15,
              width: context.width * 0.4,
              child: SvgPicture.asset(
                Assets.assetsImagesVector1,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: context.height * 0.18,
              width: context.width * 0.4,
              child: SvgPicture.asset(
                Assets.assetsImagesVector2,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
