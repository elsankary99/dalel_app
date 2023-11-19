import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      height: context.height * 0.15,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: AppColors.primaryColor, blurRadius: 1)],
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: const Color(0xffFFF0EE),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(
                      Icons.house_sharp,
                      color: Colors.grey,
                    ),
                    Text(
                      AppStrings.home,
                      style: CustomTextStyles.poppins500style12
                          .copyWith(color: Colors.grey),
                    )
                  ]),
                ),
                Text(
                  "Ahmed Ebrahim",
                  style: CustomTextStyles.poppins500style16
                      .copyWith(color: AppColors.deepBrown),
                ),
                Text(
                  "Aldakhliya - Mansoura",
                  style: CustomTextStyles.poppins500style16
                      .copyWith(color: Colors.grey),
                )
              ]),
          Text(
            "Change",
            style:
                CustomTextStyles.poppins500style16.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
