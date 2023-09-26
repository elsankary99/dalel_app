import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';

class CartItemPrice extends StatelessWidget {
  const CartItemPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Salahdin Ring",
          style: CustomTextStyles.poppins500style14,
        ),
        Text(
          "Size : 2",
          style: CustomTextStyles.poppins400style12,
        ),
        Text(
          "\$ 1200.00",
          style: CustomTextStyles.poppins500style14
              .copyWith(color: AppColors.lightGrey),
        ),
      ],
    );
  }
}
