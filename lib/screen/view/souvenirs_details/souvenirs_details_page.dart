import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';
import 'package:test/screen/widget/periods_details_widget/adout_periods_widget.dart';

@RoutePage()
class SouvenirsDetailsPage extends StatelessWidget {
  const SouvenirsDetailsPage({super.key, required this.data});
  final HistoricalModel data;
  @override
  Widget build(BuildContext context) {
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
          SliverToBoxAdapter(child: AboutPeriodsWidget(data: data)),
          // SliverToBoxAdapter(child: HeadText(data.name! + AppStrings.wars)),
          // const SliverToBoxAdapter(child: CharacterWar()),
          // const SliverToBoxAdapter(child: HeadText(AppStrings.recommendations)),
          // SliverToBoxAdapter(child: RecommendationList(data: data)),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ]),
      ),
    );
  }
}
