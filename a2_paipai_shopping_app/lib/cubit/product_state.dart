part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  final List<Product> products;
  const ProductState({this.products});
  ProductState copyWith(List<Product> data);
  ProductState addAmountStock(Product product);
  ProductState toggleFavorite(int productId, bool isFavorite);
  ProductState resetAll();
  ProductState resetStock();
  ProductState deduceStock(int productId);
  ProductState deduceStockWithQuantity(int productId, int quantity);
  ProductState deduceCartStock(List<CartItem> cartItems);
  ProductState addStockToEachProduct(int count);
  ProductState deduceStockToHalf();
  List<Product> getFavoriteProduct();
}

class ProductInitial extends ProductState {
  final List<Product> products;

  ProductInitial({
    this.products = const <Product>[],
  });

  ProductInitial copyWith(List<Product> data) {
    final dataCopy = data.map((e) => e.copyWith()).toList();
    final dataNew = ProductInitial(products: dataCopy);
    return dataNew;
  }

  ProductInitial addAmountStock(Product product) {
    Product p = products.elementAt(product.id);
    p.stock = p.stock + 10;
    return this;
  }

  ProductInitial toggleFavorite(int productId, bool isFavorite) {
    Product p = products.elementAt(productId);
    p.isFavorite = isFavorite;
    return this;
  }

  //@Deprecate
  ProductInitial resetAll() {
    products.clear();
    List<Product> initData = ProductData.initProducts;
    products.addAll(ProductData.initProducts);
    return this;
  }

  ProductInitial deduceStock(int id) {
    if (products.elementAt(id) == null) {
      print('The product is not exist!');
      return this;
    }
    Product temp = products.elementAt(id);
    if (temp.stock > 1) {
      print('stock : ' + temp.stock.toString());
      temp.stock--;
    } else {
      products.removeAt(id);
    }
    products[id] = temp;
    return this;
  }

  @override
  List<Object> get props => [products];

  @override
  String toString() => products.map((each) => '$each').join('\n');

  @override
  ProductState addStockToEachProduct(int count) {
    products.forEach((element) {
      element.stock = element.stock + count;
    });
    return this;
  }

  @override
  ProductState deduceStockWithQuantity(int productId, int quantity) {
    if (products.elementAt(productId) == null) {
      print('The product is not exist!');
      return this;
    }
    Product product = products.elementAt(productId);
    if (product.stock < quantity) {
      print(
          'The stock is less than you purchased. please deduce cart quantity.');
      return this;
    }
    if (product.stock == quantity) {
      product.stock = 0;
    } else {
      product.stock = product.stock - quantity;
    }
    products[productId] = product;
    return this;
  }

  @override
  ProductState deduceCartStock(List<CartItem> cartItems) {
    cartItems.forEach((element) {
      Product product = element.product;
      if (element.isSelected) {
        deduceStockWithQuantity(product.id, element.quantity);
      }
    });
    return this;
  }

  @override
  List<Product> getFavoriteProduct() {
    List<Product> favoriteProducts =
        products.where((e) => e.isFavorite).toList();
    return favoriteProducts;
  }

  @override
  ProductState resetStock() {
    List<Product> initProducts = ProductData.initProducts;
    products
        .map((e) =>
            e.stock = ProductUtil.getQuantityByProductId(initProducts, e.id))
        .toList();
    return this;
  }

  @override
  ProductState deduceStockToHalf() {
    products.forEach((element) {
      element.stock = (element.stock / 2).ceil();
    });
    return this;
  }
}
