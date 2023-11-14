import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';

final periodIdProvider = StateProvider<String>((ref) => "");
final periodWarsProvider =
    FutureProvider.autoDispose<List<HistoricalModel>>((ref) async {
  final periodId = ref.watch(periodIdProvider);
  final response = await FirebaseFirestore.instance
      .collection(AppStrings.historicalPeriodsCollection)
      .doc(periodId)
      .collection(AppStrings.warCollection)
      .get();
  final data = response.docs;
  return data.map((e) => HistoricalModel.fromJson(e.id, e.data())).toList();
});
