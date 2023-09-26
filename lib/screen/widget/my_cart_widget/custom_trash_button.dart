import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';

class CustomTrashButton extends StatelessWidget {
  const CustomTrashButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.trashCan,
          color: AppColors.deepBrown,
        ));
  }
}
