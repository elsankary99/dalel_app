import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';
import 'package:test/screen/widget/my_cart_widget/cart_item_price.dart';
import 'package:test/screen/widget/my_cart_widget/custom_trash_button.dart';

class CustomCartCard extends StatelessWidget {
  const CustomCartCard({
    super.key,
    required this.data,
  });
  final BazarModel data;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomTrashButton(docId: data.id!, price: data.price!),
      Expanded(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: context.height * 0.09,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  width: context.width * 0.18,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: CachedNetworkImage(imageUrl: data.imageUrl!),
                ),
                SizedBox(width: 10.w),
                Expanded(
                    child: CartItemPrice(name: data.name!, price: data.price!)),
              ]),
            ),
          ),
        ),
      )
    ]);
  }
}
