import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalPaymentProvider =
    ChangeNotifierProvider<TotalPaymentNotifier>((ref) {
  return TotalPaymentNotifier();
});

class TotalPaymentNotifier extends ChangeNotifier {
  int totalPrice = 0;
  addToTotal(int price) {
    log("before $totalPrice");

    totalPrice += price;
    log("after $totalPrice");
    notifyListeners();
  }

  minceFromTotal(int price) {
    log("-before $totalPrice");

    totalPrice -= price;
    log("-after $totalPrice");
    notifyListeners();
  }
}
