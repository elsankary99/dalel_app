import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';

class AboutPeriodsWidget extends StatelessWidget {
  const AboutPeriodsWidget({
    super.key,
    required this.data,
  });

  final HistoricalModel data;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        AppStrings.about + data.name!,
        style: CustomTextStyles.poppins400style20,
      ),
      CachedNetworkImage(
        imageUrl: data.imageUrl!,
        height: context.height * 0.4,
        width: context.width * 0.38,
      ),
      Text(
        data.description!,
        style: CustomTextStyles.poppins500style14.copyWith(color: Colors.black),
        maxLines: 10,
      ),
    ]);
  }
}
