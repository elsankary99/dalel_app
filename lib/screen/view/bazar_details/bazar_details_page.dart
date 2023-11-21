import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_circle_indicator.dart';
import 'package:test/core/widget/custom_toast.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';
import 'package:test/provider/cart_provider/cart_provider.dart';
import 'package:test/provider/total_payment/total_payment_provider.dart';
import 'package:test/screen/widget/bazar_details_widget/bazar_details_body.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';

@RoutePage()
class BazarDetailsPage extends ConsumerWidget {
  const BazarDetailsPage(this.data, {super.key});
  final BazarModel data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(cartProvider.notifier);
    final state = ref.watch(cartProvider);
    ref.listen(
      cartProvider,
      (previous, next) {
        if (next is AddToCartError) {
          customToast(title: next.message, color: Colors.red);
        }
        if (next is AddToCartSuccess) {
          customToast(title: "Item Add To Cart Successfully");
          ref.invalidate(getDalelCartProvider);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [HomeAppBarText()],
      ),
      body: Stack(
        children: [
          BazarDetailsBody(data: data),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: context.height * 0.15,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: AppColors.primaryColor, blurRadius: 2)
                ], color: Colors.white),
                child: Center(
                  child: SizedBox(
                    height: context.height * 0.065,
                    width: context.width * 0.7,
                    child: state is AddToCartLoading
                        ? CustomCircleIndicator(
                            color: AppColors.brown,
                          )
                        : ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(totalPaymentProvider.notifier)
                                  .addToTotal(int.parse(data.price!));
                              provider.addToCart(data);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                backgroundColor: AppColors.primaryColor),
                            child: Text(
                              "Add To Cart",
                              style: CustomTextStyles.poppins400style14,
                            )),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
