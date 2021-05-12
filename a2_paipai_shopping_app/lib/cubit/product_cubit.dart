library product_cubit;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/product_util.dart';
import '../model/product_model.dart';
import '../model/cart.dart';
import '../data/products_data.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void init() {
    emit(ProductInitial(products: ProductData.initProducts));
  }

  void addAmountStock(Product product) {
    emit(state.copyWith(state.products).addAmountStock(product));
  }

  void toggleFavorite(int productId) {
    emit(state.copyWith(state.products).toggleFavorite(
        productId, !state.products.elementAt(productId).isFavorite));
  }

  //@Deprecate
  void resetAll() {
    emit(state.copyWith(state.products).resetAll());
  }

  void deduceStock(int productId) {
    emit(state.copyWith(state.products).deduceStock(productId));
  }

  void addStockToEachProduct(int count) {
    emit(state.copyWith(state.products).addStockToEachProduct(count));
  }

  void deduceCartStock(List<CartItem> cartItems) {
    emit(state.copyWith(state.products).deduceCartStock(cartItems));
  }

  void resetStock() {
    emit(state.copyWith(state.products).resetStock());
  }

  void deduceStockToHalf() {
    emit(state.copyWith(state.products).deduceStockToHalf());
  }

  List<Product> getFavoriteProducts() {
    List<Product> favoriteProducts =
        state.copyWith(state.products).getFavoriteProduct();
    return favoriteProducts;
  }
}
