library cart_cubit;

import '../utils/product_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/cart.dart';
import '../model/product_model.dart';
import '../data/products_data.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void init() {
    emit(CartState(cartItems: const []));
  }

  void addItem(CartItem cartItem) {
    CartState cartState = state.copyWith(state.cartItems).addItem(cartItem);
    emit(cartState);
  }

  void removeItem(int productId) {
    emit(state.copyWith(state.cartItems).removeItem(productId));
  }

  void clearCart() {
    emit(state.copyWith(state.cartItems).clearCart());
  }

  void checkoutSelectItems() {
    emit(state.copyWith(state.cartItems).checkoutSelectItems());
  }

  void toggleSelectItem(int productId) {
    emit(state.copyWith(state.cartItems).toggleSelectItem(productId));
  }

  void resetCartStock() {
    emit(state.copyWith(state.cartItems).resetCartStock());
  }
}
