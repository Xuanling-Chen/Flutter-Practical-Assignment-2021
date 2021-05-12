import '../model/product_model.dart';

class ProductUtil {
  static int getQuantityByProductId(List<Product> products, int productId) {
    for (Product p in products) {
      if (p.id == productId) {
        return p.stock;
      }
    }
    return 0;
  }
}
