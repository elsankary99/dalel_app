import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';

@RoutePage()
class BazarDetailsPage extends ConsumerWidget {
  const BazarDetailsPage(this.data, {super.key});
  final BazarModel data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [HomeAppBarText()],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                    child: SizedBox(height: context.height * 0.02)),
                SliverToBoxAdapter(
                    child: Hero(
                  tag: data.imageUrl!,
                  child: CachedNetworkImage(
                    imageUrl: data.imageUrl!,
                    height: context.height * 0.25,
                  ),
                )),
                SliverToBoxAdapter(
                    child: SizedBox(height: context.height * 0.02)),
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
                SliverToBoxAdapter(
                    child: SizedBox(height: context.height * 0.02)),
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
                SliverToBoxAdapter(
                    child: SizedBox(height: context.height * 0.02)),
                SliverToBoxAdapter(
                  child: Center(
                    child: ReadMoreText(
                      data.description!,
                      trimLines: 3,
                      style: CustomTextStyles.poppins300style16,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      lessStyle: CustomTextStyles.poppins300style16
                          .copyWith(color: AppColors.primaryColor),
                      moreStyle: CustomTextStyles.poppins300style16
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: SizedBox(height: context.height * 0.16)),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: context.height * 0.15,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: AppColors.primaryColor, blurRadius: 2)
                ], color: Colors.white),
                child: Center(
                  child: SizedBox(
                    height: context.height * 0.065,
                    width: context.width * 0.7,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: AppColors.deepBrown),
                        child: Text(
                          "Add To Cart",
                          style: CustomTextStyles.poppins400style14,
                        )),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
