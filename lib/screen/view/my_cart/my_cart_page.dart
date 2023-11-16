import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/provider/cart_provider/cart_provider.dart';
import 'package:test/screen/view/my_cart/cart_shimmer.dart';
import 'package:test/screen/widget/home_widget/error_text.dart';
import 'package:test/screen/widget/my_cart_widget/custom_appbar_text.dart';
import 'package:test/screen/widget/my_cart_widget/custom_back_button.dart';
import 'package:test/screen/widget/my_cart_widget/custom_cart_card.dart';

@RoutePage()
class MyCartPage extends ConsumerWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 6, right: 10),
        child: ref.watch(getDalelCartProvider).when(
              skipLoadingOnReload: true,
              data: (data) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CustomCartCard(
                    data: data[index],
                  );
                },
              ),
              error: (error, _) => ErrorText(error: error.toString()),
              loading: () => ListView.builder(
                itemCount: 8,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: CartShimmer(),
                  );
                },
              ),
            ),
      ),
    );
  }
}
