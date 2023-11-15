import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/screen/widget/home_widget/bazar_historical_souvenirs_list.dart';
import 'package:test/screen/widget/home_widget/bazar_history_books_list.dart';
import 'package:test/screen/widget/home_widget/head_text.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: HeadText(AppStrings.historyBooks)),
            const SliverToBoxAdapter(child: BazarHistoryBooksList()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.015)),
            const SliverToBoxAdapter(
                child: HeadText(AppStrings.historicalSouvenirs)),
            const SliverToBoxAdapter(child: BazarHistoricalSouvenirsList()),
          ],
        ),
        Positioned(
          bottom: 16.0, // Adjust the position as needed
          right: 16.0, // Adjust the position as needed
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              context.router.push(const MyCartRoute());
            },
            child: Icon(
              FontAwesomeIcons.cartShopping,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
