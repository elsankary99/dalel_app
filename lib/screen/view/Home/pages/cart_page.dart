import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/home_widget/head_text.dart';
import 'package:test/screen/widget/home_widget/historical_characters_widget.dart';
import 'package:test/screen/widget/home_widget/historical_periods_widget.dart';
import 'package:test/screen/widget/home_widget/historical_souvenirs_widget.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
                child: HeadText(AppStrings.historicalPeriods)),
            const SliverToBoxAdapter(child: HistoricalPeriodsWidget()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.015)),
            const SliverToBoxAdapter(
                child: HeadText(AppStrings.historicalCharacters)),
            const SliverToBoxAdapter(child: HistoricalCharactersWidget()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.025)),
            const SliverToBoxAdapter(
                child: HeadText(AppStrings.historicalSouvenirs)),
            const SliverToBoxAdapter(child: HistoricalSouvenirsWidget()),
          ],
        ),
        Positioned(
          bottom: 16.0, // Adjust the position as needed
          right: 16.0, // Adjust the position as needed
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              // FAB onPressed callback
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
