import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/my_cart_widget/custom_quantity_button.dart';

class QuantityItemWidget extends StatefulWidget {
  const QuantityItemWidget({
    super.key,
  });

  @override
  State<QuantityItemWidget> createState() => _QuantityItemWidgetState();
}

class _QuantityItemWidgetState extends State<QuantityItemWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.18,
      height: context.height * 0.034,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomQuantityButton(
            onTap: () {
              if (quantity > 1) {
                setState(() {
                  quantity--;
                });
              }
            },
            color: AppColors.grey,
            icon: FontAwesomeIcons.minus,
          ),
          Text("$quantity"),
          CustomQuantityButton(
            onTap: () {
              setState(() {
                quantity++;
              });
            },
            color: AppColors.blackGrey,
            icon: FontAwesomeIcons.plus,
          ),
        ],
      ),
    );
  }
}
