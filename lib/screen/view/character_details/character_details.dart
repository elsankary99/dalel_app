import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';
import 'package:test/screen/widget/home_widget/head_text.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';
import 'package:test/screen/widget/character_details_widget/about_character_widget.dart';
import 'package:test/screen/widget/character_details_widget/charcater_war.dart';

@RoutePage()
class CharacterDetailsPage extends ConsumerWidget {
  const CharacterDetailsPage({required this.data, super.key});
  final HistoricalModel data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [HomeAppBarText()],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.w),
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverToBoxAdapter(child: AboutCharacterWidget(data: data)),
          SliverToBoxAdapter(child: HeadText(data.name! + AppStrings.wars)),
          const SliverToBoxAdapter(child: CharacterWar()),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ]),
      ),
    );
  }
}
