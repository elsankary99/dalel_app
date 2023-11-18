import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class CustomPaymentBottomCard extends StatelessWidget {
  const CustomPaymentBottomCard({
    super.key,
    required this.price,
    required this.title,
    this.onPressed,
  });
  final String price;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.17,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: AppColors.primaryColor, blurRadius: 2)]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.totalPayment,
                style: CustomTextStyles.poppins600style12,
              ),
              Text(
                r"$" "$price",
                style: CustomTextStyles.poppins500style18
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            height: context.height * 0.07,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
                onPressed: onPressed,
                child: Text(
                  title,
                  style: CustomTextStyles.poppins500style14.copyWith(
                      color: AppColors.offWhite, fontWeight: FontWeight.w600),
                )),
          )
        ]),
      ),
    );
  }
}
