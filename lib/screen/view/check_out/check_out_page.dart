import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/provider/total_payment/total_payment_provider.dart';
import 'package:test/screen/widget/checkout_widget/delevry_address_widget.dart';
import 'package:test/screen/widget/checkout_widget/payment_method_widget.dart';
import 'package:test/screen/widget/checkout_widget/selected_product_widget.dart';
import 'package:test/screen/widget/home_widget/head_text.dart';
import 'package:test/screen/widget/my_cart_widget/custom_payment_bottom_card.dart';

@RoutePage()
class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.checkoutScreen,
          style: CustomTextStyles.poppins500style18
              .copyWith(color: AppColors.deepBrown),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                const SliverToBoxAdapter(
                    child: HeadText(AppStrings.deliveryAddress)),
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                const SliverToBoxAdapter(child: DeliveryAddressWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                const SliverToBoxAdapter(
                    child: HeadText(AppStrings.selectedProduct)),
                const SliverToBoxAdapter(child: SelectedProduct()),
                const SliverToBoxAdapter(
                    child: HeadText(AppStrings.paymentMethod)),
                SliverToBoxAdapter(child: SizedBox(height: 4.h)),
                const SliverToBoxAdapter(child: PaymentMethodWidget()),
                SliverToBoxAdapter(
                    child: SizedBox(height: context.height * 0.19)),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Consumer(
                builder: (context, ref, child) {
                  final provider = ref.watch(totalPaymentProvider.notifier);
                  ref.watch(totalPaymentProvider);
                  return CustomPaymentBottomCard(
                    onPressed: () {
                      context.router.push(const OrderSuccessRoute());
                    },
                    price: provider.totalPrice.toString(),
                    title: AppStrings.confirmPayment,
                  );
                },
              ))
        ],
      ),
    );
  }
}
