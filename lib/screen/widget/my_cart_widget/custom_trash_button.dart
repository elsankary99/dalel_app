import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/widget/custom_toast.dart';
import 'package:test/provider/cart_provider/cart_provider.dart';
import 'package:test/provider/total_payment/total_payment_provider.dart';

class CustomTrashButton extends ConsumerWidget {
  const CustomTrashButton({
    required this.price,
    required this.docId,
    super.key,
  });
  final String docId;
  final String price;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(cartProvider.notifier);
    final totalPrice = ref.read(totalPaymentProvider.notifier);
    ref.listen(
      cartProvider,
      (previous, next) {
        if (next is DeleteFromCartError) {
          customToast(title: next.message, color: Colors.red);
        }
        if (next is DeleteFromCartSuccess) {
          customToast(title: "Item Deleted Successfully");
          ref.invalidate(getDalelCartProvider);
        }
      },
    );
    return SizedBox(
      child: IconButton(
          onPressed: () {
            if (totalPrice.totalPrice > 0) {
              totalPrice.minceFromTotal(int.parse(price));
            }
            provider.deleteFromCart(docId);
          },
          icon: Icon(
            FontAwesomeIcons.trashCan,
            color: AppColors.deepBrown,
          )),
    );
  }
}
