import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';

final periodsProvider = FutureProvider<List<HistoricalModel>>((ref) async {
  final response = await FirebaseFirestore.instance
      .collection(AppStrings.historicalPeriodsCollection)
      .get();
  final data = response.docs;
  return data.map((e) => HistoricalModel.fromJson(e.id, e.data())).toList();
});
