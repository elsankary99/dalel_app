import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              color: AppColors.primaryColor, shape: BoxShape.circle),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ahmed Ebrahim",
              style: CustomTextStyles.poppins500style18
                  .copyWith(color: AppColors.deepBrown),
            ),
            SizedBox(height: context.height * 0.01),
            Text("elsankary@gmail.com",
                style: CustomTextStyles.poppins500style16
                    .copyWith(color: AppColors.blackGrey))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon:
                Icon(FontAwesomeIcons.penToSquare, color: AppColors.blackGrey))
      ],
    );
  }
}
