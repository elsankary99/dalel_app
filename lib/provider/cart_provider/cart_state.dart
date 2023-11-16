part of 'cart_provider.dart';

abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {
  final String message;
  const AddToCartError(this.message);
}
//?Delete

class DeleteFromCartLoading extends CartState {}

class DeleteFromCartSuccess extends CartState {}

class DeleteFromCartError extends CartState {
  final String message;
  const DeleteFromCartError(this.message);
}
