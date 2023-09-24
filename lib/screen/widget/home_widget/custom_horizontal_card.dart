import 'package:flutter/material.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class CustomHorizontalCard extends StatelessWidget {
  const CustomHorizontalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.45,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.width * 0.2,
                child: Text(
                  AppStrings.ancientEgyptWars,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: CustomTextStyles.poppins500style16,
                ),
              ),
              const Spacer(),
              Image.asset(Assets.assetsImagesFrame)
            ],
          ),
        ),
      ),
    );
  }
}
