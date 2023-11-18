import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/provider/total_payment/total_payment_provider.dart';
import 'package:test/screen/widget/my_cart_widget/custom_quantity_button.dart';

class CartItemPrice extends StatefulWidget {
  const CartItemPrice({
    super.key,
    required this.price,
    required this.name,
  });
  final String price;
  final String name;

  @override
  State<CartItemPrice> createState() => _CartItemPriceState();
}

class _CartItemPriceState extends State<CartItemPrice> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.name,
          maxLines: 1,
          style: CustomTextStyles.poppins500style14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$ ${int.parse(widget.price) * quantity}",
              style: CustomTextStyles.poppins500style14
                  .copyWith(color: AppColors.lightGrey),
            ),
            SizedBox(
              width: context.width * 0.18,
              height: context.height * 0.034,
              child: Consumer(
                builder: (context, ref, child) {
                  final provider = ref.read(totalPaymentProvider.notifier);
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomQuantityButton(
                        onTap: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                              provider.minceFromTotal(int.parse(widget.price));
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
                            provider.addToTotal(int.parse(widget.price));
                          });
                        },
                        color: AppColors.blackGrey,
                        icon: FontAwesomeIcons.plus,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
