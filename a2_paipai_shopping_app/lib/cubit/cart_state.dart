part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem> cartItems;
  const CartState({this.cartItems = const <CartItem>[]});

  @override
  List<Object> get props => [cartItems];

  CartState copyWith(List<CartItem> cartItems) {
    final dataCopy = cartItems.map((e) => e.copyWith()).toList();
    final dataNew = CartState(cartItems: dataCopy);
    return dataNew;
  }

  CartState addItem(CartItem cartItem) {
    bool isUpdate = false;
    cartItems.forEach((element) {
      if (element.product.id == cartItem.product.id) {
        element.quantity = element.quantity + 1;
        isUpdate = true;
        return;
      }
    });
    if (!isUpdate) {
      cartItems.add(CartItem(product: cartItem.product, quantity: 1));
    }
    return this;
  }

  CartState removeItem(int productId) {
    if (cartItems == null) {
      print('nothing in cart now, please add product to cart first.');
      return this;
    }
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].product.id == productId) {
        if (cartItems[i].quantity > 1) {
          cartItems[i] = CartItem(
              product: cartItems[i].product,
              quantity: cartItems[i].quantity - 1,
              isSelected: cartItems[i].isSelected);
        } else {
          cartItems.remove(cartItems[i]);
        }
      }
    }
    return this;
  }

  int get itemCount {
    return cartItems.length;
  }

  CartState clearCart() {
    cartItems.clear();
    return this;
  }

  CartState checkoutSelectItems() {
    final filterData =
        cartItems.where((element) => !element.isSelected).toList();
    final newState = CartState(cartItems: filterData);
    return newState;
  }

  CartState toggleSelectItem(int productId) {
    if (cartItems == null) {
      print('nothing in cart now, please add product to cart first.');
      return this;
    }
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].product.id == productId) {
        cartItems[i] = CartItem(
            product: cartItems[i].product,
            quantity: cartItems[i].quantity,
            isSelected: !cartItems[i].isSelected);
        return this;
      }
    }
    return this;
  }

  CartState resetCartStock() {
    List<Product> initProducts = ProductData.initProducts;
    cartItems.map((element) {
      element.product.stock =
          ProductUtil.getQuantityByProductId(initProducts, element.product.id);
    }).toList();
    return this;
  }
}
