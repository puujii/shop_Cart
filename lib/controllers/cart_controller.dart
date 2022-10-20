import 'package:get/get.dart';

import 'package:product_test/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + double.parse(item.price));
  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeCart(int id) {
    cartItems.removeWhere((item) => item.id == id);
  }
}
