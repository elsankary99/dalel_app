import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';

final getHistoryBookProvider = FutureProvider<List<BazarModel>>((ref) async {
  final response = await FirebaseFirestore.instance
      .collection(AppStrings.bazarBooksCollection)
      .get();
  final data = response.docs;
  log("getHistoryBookProvider");
  return data.map((e) => BazarModel.fromJson(e.id, e.data())).toList();
});
