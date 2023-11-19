import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';

class BazarDetailsBody extends StatelessWidget {
  const BazarDetailsBody({
    super.key,
    required this.data,
  });

  final BazarModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          SliverToBoxAdapter(
              child: Hero(
            tag: data.imageUrl!,
            child: CachedNetworkImage(
              imageUrl: data.imageUrl!,
              height: context.height * 0.25,
            ),
          )),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                data.name!,
                style: CustomTextStyles.poppins500style18.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                "Price : " + data.price! + r" $",
                style: CustomTextStyles.poppins500style18.copyWith(
                    color: AppColors.deepBrown,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                data.description!,
                style: CustomTextStyles.poppins300style16,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.16)),
        ],
      ),
    );
  }
}
