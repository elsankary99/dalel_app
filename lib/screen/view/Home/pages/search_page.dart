import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/widget/home_widget/custom_search_feild.dart';
import 'package:test/screen/widget/home_widget/list_of_type.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: CustomSearchTextField()),
        SliverToBoxAdapter(
            child: Text(AppStrings.recent,
                style: CustomTextStyles.poppins600style12)),
        SliverToBoxAdapter(child: SizedBox(height: context.height * 0.015)),
        const SliverToBoxAdapter(child: ListOfType()),
      ],
    );
  }
}
