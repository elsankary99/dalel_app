import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';
import 'package:test/screen/widget/home_widget/head_text.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';
import 'package:test/screen/widget/Souvenirs_details_widget/adout_souvenir_widget.dart';
import 'package:test/screen/widget/Souvenirs_details_widget/recommendation_souvenirs.dart';

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
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(child: AboutSouvenirsWidget(data: data)),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const HeadText(AppStrings.recommendations),
        )),
        const SliverToBoxAdapter(child: RecommendationSouvenirs()),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
      ]),
    );
  }
}
