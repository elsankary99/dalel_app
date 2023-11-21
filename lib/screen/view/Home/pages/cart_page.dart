import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/screen/widget/home_widget/bazar_historical_souvenirs_list.dart';
import 'package:test/screen/widget/home_widget/bazar_history_books_list.dart';
import 'package:test/screen/widget/home_widget/head_text.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Bazar",
                style: CustomTextStyles.poppins400style20,
              ),
              automaticallyImplyLeading: false,
              leading: Icon(
                FontAwesomeIcons.gripLines,
                color: AppColors.deepBrown,
              ),
              // title: Image.asset(Assets.assetsImagesPyramid),
              backgroundColor: Colors.transparent,
              actions: const [HomeAppBarText()],
            ),
            const SliverToBoxAdapter(child: HeadText(AppStrings.historyBooks)),
            const SliverToBoxAdapter(child: BazarHistoryBooksList()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.015)),
            const SliverToBoxAdapter(
                child: HeadText(AppStrings.historicalSouvenirs)),
            const SliverToBoxAdapter(child: BazarHistoricalSouvenirsList()),
          ],
        ),
        PositionedDirectional(
          bottom: 15.0.h, // Adjust the position as needed
          end: 0.0, // Adjust the position as needed
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              context.router.push(const MyCartRoute());
            },
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 28.sp,
              color: AppColors.offWhite,
            ),
          ),
        ),
      ],
    );
  }
}
