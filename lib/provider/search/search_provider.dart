import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';

final searchProvider = StateProvider<String>((ref) => '');
final searchOnBazarProvider =
    FutureProvider.autoDispose<List<BazarModel>>((ref) async {
  final searchValue = ref.watch(searchProvider);
  log(searchValue);
  final fireStore = FirebaseFirestore.instance;

  final searchedBooks = await fireStore
      .collection(AppStrings.bazarBooksCollection)
      .where("name", isEqualTo: searchValue)
      .get();
  final data = searchedBooks.docs;
  log("data : $data");
  return data.map((e) => BazarModel.fromJson(e.id, e.data())).toList();
});
