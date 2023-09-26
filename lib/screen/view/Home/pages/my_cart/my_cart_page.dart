import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/screen/widget/my_cart_widget/custom_appbar_text.dart';
import 'package:test/screen/widget/my_cart_widget/custom_back_button.dart';
import 'package:test/screen/widget/my_cart_widget/custom_cart_card.dart';
import 'package:test/screen/widget/my_cart_widget/custom_trash_button.dart';

@RoutePage()
class MyCartPage extends ConsumerWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CustomTrashButton()],
        title: const AppBarText(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 6, right: 10),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => const CustomCartCard(),
            ),
          ),
        ]),
      ),
    );
  }
}
