import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/authentication_widget/custom_check_box.dart';
import 'package:test/screen/widget/my_cart_widget/cart_item_price.dart';
import 'package:test/screen/widget/my_cart_widget/quantity_item_widget.dart';

class CustomCartCard extends StatelessWidget {
  const CustomCartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const CustomCheckBox(),
      Expanded(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: context.height * 0.09,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: context.width * 0.18,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const CartItemPrice(),
                    const QuantityItemWidget()
                  ]),
            ),
          ),
        ),
      )
    ]);
  }
}
