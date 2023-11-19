import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({
    super.key,
  });

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  List<String> paymentList = [
    AppStrings.myCreditCard,
    AppStrings.myElectricCash,
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...paymentList.asMap().keys.map(
          (e) {
            log(e.toString());
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = e;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 2.w),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                height: context.height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: currentIndex == e
                              ? Colors.grey
                              : AppColors.primaryColor,
                          blurRadius: currentIndex == e ? 3 : 1)
                    ],
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Opacity(
                          opacity: currentIndex == e ? 1 : 0.5,
                          child: Image.asset(
                            Assets.assetsImagesCard,
                            height: context.height * 0.055,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Text(paymentList[e],
                            style: CustomTextStyles.poppins500style18
                                .copyWith(color: AppColors.deepBrown))
                      ],
                    ),
                    Container(
                      height: context.height * 0.026,
                      width: context.height * 0.026,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.blackGrey,
                              width: currentIndex == e ? 5.w : 1.5.w),
                          // color: AppColors.deepBrown,
                          shape: BoxShape.circle),
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
