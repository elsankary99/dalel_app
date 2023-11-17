import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';

final getHistoricalSouvenirProvider =
    FutureProvider<List<BazarModel>>((ref) async {
  final response = await FirebaseFirestore.instance
      .collection(AppStrings.bazarSouvenirCollection)
      .get();
  final data = response.docs;
  return data.map((e) => BazarModel.fromJson(e.id, e.data())).toList();
});
