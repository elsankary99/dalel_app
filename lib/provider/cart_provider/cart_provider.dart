import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';

part 'cart_state.dart';

final getDalelCartProvider =
    FutureProvider.autoDispose<List<BazarModel>>((ref) async {
  final response =
      await FirebaseFirestore.instance.collection("DalelCart").get();
  final data = response.docs;

  return data.map((e) => BazarModel.fromJson(e.id, e.data())).toList();
});
//?==============================================================
final cartProvider =
    StateNotifierProvider<CartProvider, CartState>((ref) => CartProvider());

class CartProvider extends StateNotifier<CartState> {
  CartProvider() : super(CartInitial());

  final fireStore = FirebaseFirestore.instance.collection("DalelCart");

  Future<void> addToCart(BazarModel data) async {
    try {
      state = AddToCartLoading();
      await fireStore.add({
        "image_url": data.imageUrl,
        "name": data.name,
        "description": data.description,
        "price": data.price,
      });
      state = AddToCartSuccess();
    } catch (e) {
      state = AddToCartError(e.toString());
    }
  }

  Future<void> deleteFromCart(String docId) async {
    try {
      state = DeleteFromCartLoading();
      await fireStore.doc(docId).delete();
      state = DeleteFromCartSuccess();
    } catch (e) {
      state = DeleteFromCartError(e.toString());
    }
  }
}
