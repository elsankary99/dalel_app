import 'package:flutter/material.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/home_widget/custom_horizontal_card.dart';

class HistoricalPeriodsWidget extends StatelessWidget {
  const HistoricalPeriodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: CustomHorizontalCard(),
          );
        },
      ),
    );
  }
}
