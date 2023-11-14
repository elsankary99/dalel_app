import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';

final characterIdProvider = StateProvider<String>((ref) => "");
final characterWarsProvider =
    FutureProvider<List<HistoricalModel>>((ref) async {
  final characterId = ref.watch(characterIdProvider);
  final response = await FirebaseFirestore.instance
      .collection(AppStrings.historicalCharactersCollection)
      .doc(characterId)
      .collection(AppStrings.warCollection)
      .get();
  final data = response.docs;
  return data.map((e) => HistoricalModel.fromJson(e.id, e.data())).toList();
});
