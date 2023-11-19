import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';

class AboutWarWidget extends StatelessWidget {
  const AboutWarWidget({
    super.key,
    required this.data,
  });

  final HistoricalModel data;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          AppStrings.about + data.name!,
          style: CustomTextStyles.poppins400style20,
        ),
      ),
      SizedBox(height: 10.h),
      Center(
        child: CachedNetworkImage(
          imageUrl: data.imageUrl!,
          height: context.height * 0.36,
        ),
      ),
      SizedBox(height: 10.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          data.description!,
          style:
              CustomTextStyles.poppins500style14.copyWith(color: Colors.black),
        ),
      ),
    ]);
  }
}
