import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/horizontal_shimmer.dart';
import 'package:test/provider/periods_provider/periods_provider.dart';
import 'package:test/screen/widget/home_widget/custom_horizontal_card.dart';
import 'package:test/screen/widget/home_widget/error_text.dart';

class CharacterWar extends ConsumerWidget {
  const CharacterWar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height * 0.15,
      child: ref.watch(periodsProvider).when(
            data: (data) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: CustomHorizontalCard(
                      imageUrl: data[index].imageUrl!, name: data[index].name!),
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
                  child: HorizontalShimmer(),
                );
              },
            ),
          ),
    );
  }
}
