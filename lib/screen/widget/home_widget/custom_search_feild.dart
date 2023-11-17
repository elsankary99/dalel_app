import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/provider/search/search_provider.dart';

class CustomSearchTextField extends ConsumerWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        style: CustomTextStyles.poppins600style12
            .copyWith(color: AppColors.offWhite),
        onChanged: (value) {
          ref.read(searchProvider.notifier).state = value;
          log("value = $value");
        },
        cursorColor: AppColors.offWhite,
        decoration: InputDecoration(
            hintText: AppStrings.searchDeepIntoTheHistory,
            hintStyle: CustomTextStyles.poppins400style14,
            prefixIcon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: AppColors.offWhite,
            ),
            focusColor: AppColors.deepBrown,
            border: InputBorder.none),
      ),
    );
  }
}
