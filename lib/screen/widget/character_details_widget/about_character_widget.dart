import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';

class AboutCharacterWidget extends StatelessWidget {
  const AboutCharacterWidget({
    super.key,
    required this.data,
  });

  final HistoricalModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.about + data.name!,
            style: CustomTextStyles.poppins400style20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ReadMoreText(
                  data.description!,
                  trimLines: 10,
                  style: CustomTextStyles.poppins500style14
                      .copyWith(color: Colors.black),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  lessStyle: CustomTextStyles.poppins300style16
                      .copyWith(color: AppColors.primaryColor),
                  moreStyle: CustomTextStyles.poppins300style16
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              Hero(
                tag: data.imageUrl!,
                child: CachedNetworkImage(
                  imageUrl: data.imageUrl!,
                  height: context.height * 0.4,
                  width: context.width * 0.38,
                ),
              )
            ],
          )
        ]);
  }
}
