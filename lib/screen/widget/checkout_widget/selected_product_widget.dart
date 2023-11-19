import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/provider/cart_provider/cart_provider.dart';
import 'package:test/screen/widget/home_widget/error_text.dart';
import 'package:test/screen/widget/my_cart_widget/cart_shimmer.dart';

class SelectedProduct extends ConsumerWidget {
  const SelectedProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ref.watch(getDalelCartProvider).when(
            data: (data) => ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 2.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                  height: context.height * 0.13,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: AppColors.primaryColor, blurRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      SizedBox(
                          // height: context.height * 0.1,
                          width: context.width * 0.15,
                          child: CachedNetworkImage(
                              imageUrl: data[index].imageUrl!)),
                      SizedBox(width: 10.w),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              data[index].name!,
                              maxLines: 1,
                              style: CustomTextStyles.poppins500style14,
                            ),
                            Text(
                              "\$ ${data[index].price} ",
                              style: CustomTextStyles.poppins500style14
                                  .copyWith(color: AppColors.lightGrey),
                            ),
                          ]),
                    ],
                  ),
                );
              },
            ),
            error: (error, _) => ErrorText(error: error.toString()),
            loading: () => ListView.builder(
              itemCount: 8,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: CartShimmer(),
                );
              },
            ),
          ),
    );
  }
}
