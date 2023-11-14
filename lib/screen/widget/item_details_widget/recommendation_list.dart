import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/virtical_shimmer.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';
import 'package:test/provider/recommendation_provider/recommendation_provider.dart';
import 'package:test/screen/widget/home_widget/error_text.dart';
import 'package:test/screen/widget/item_details_widget/recommendation_widget.dart';

class RecommendationList extends ConsumerWidget {
  const RecommendationList({
    super.key,
    required this.data,
  });

  final HistoricalModel data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height * 0.23,
      child: ref.watch(recommendationProvider).when(
            data: (data) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: RecommendationWidget(
                    imageUrl: data[index].imageUrl!,
                    name: data[index].name!,
                    onTap: () {},
                  ),
                );
              },
            ),
            error: (error, _) => ErrorText(error: error.toString()),
            loading: () => ListView.builder(
              itemCount: 8,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: VerticalShimmer(),
                );
              },
            ),
          ),
    );
  }
}
