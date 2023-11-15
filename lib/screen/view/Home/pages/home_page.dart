import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/home_widget/head_text.dart';
import 'package:test/screen/widget/home_widget/historical_characters_widget.dart';
import 'package:test/screen/widget/home_widget/historical_periods_widget.dart';
import 'package:test/screen/widget/home_widget/historical_souvenirs_widget.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Icon(
            FontAwesomeIcons.gripLines,
            color: AppColors.deepBrown,
          ),
          // title: Image.asset(Assets.assetsImagesPyramid),
          backgroundColor: Colors.transparent,
          actions: const [HomeAppBarText()],
        ),
        const SliverToBoxAdapter(child: HeadText(AppStrings.historicalPeriods)),
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
    );
  }
}
