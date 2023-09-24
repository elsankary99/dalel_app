import 'package:flutter/material.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/home_widget/custom_vertical_card.dart';

class HistoricalCharactersWidget extends StatelessWidget {
  const HistoricalCharactersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.23,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomVerticalCard(
              image: Assets.assetsImagesNapilion,
              text: AppStrings.napoleon,
            ),
          );
        },
      ),
    );
  }
}
