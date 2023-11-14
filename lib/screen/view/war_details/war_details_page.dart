import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';
import 'package:test/screen/widget/home_widget/home_appbar_text.dart';
import 'package:test/screen/widget/war_details_page/about_war_widget.dart';

@RoutePage()
class WarDetailsPage extends ConsumerWidget {
  const WarDetailsPage(this.data, {super.key});
  final HistoricalModel data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [HomeAppBarText()],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: AboutWarWidget(data: data)),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ],
      ),
    );
  }
}
