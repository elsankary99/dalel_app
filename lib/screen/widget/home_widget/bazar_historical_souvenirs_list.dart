import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/router/app_router.dart';
import 'package:test/core/widget/virtical_shimmer.dart';
import 'package:test/provider/bazar_historical_souvenirs/bazar_historical_souvenirs_provider.dart';
import 'package:test/screen/widget/home_widget/custom_vertical_card.dart';
import 'package:test/screen/widget/home_widget/error_text.dart';

class BazarHistoricalSouvenirsList extends ConsumerWidget {
  const BazarHistoricalSouvenirsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height * 0.23,
      child: ref.watch(getHistoricalSouvenirProvider).when(
            data: (data) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CustomVerticalCard(
                    onTap: () {
                      context.router.push(BazarDetailsRoute(data: data[index]));
                    },
                    imageUrl: data[index].imageUrl!,
                    name: data[index].name!,
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
