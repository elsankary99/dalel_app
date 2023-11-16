import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/screen/widget/my_cart_widget/quantity_item_widget.dart';

class CartItemPrice extends StatelessWidget {
  const CartItemPrice({
    super.key,
    required this.price,
    required this.name,
  });
  final String price;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          maxLines: 1,
          style: CustomTextStyles.poppins500style14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$ $price",
              style: CustomTextStyles.poppins500style14
                  .copyWith(color: AppColors.lightGrey),
            ),
            const QuantityItemWidget()
          ],
        ),
      ],
    );
  }
}
