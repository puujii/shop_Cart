import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:product_test/models/product.dart';
import 'package:product_test/service/get_products.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    //await Future.delayed(Duration(seconds: 1));

    var productsList = await RemoteServices.fetchProducts();

    if (productsList != null) {
      products.value = productsList;
    }
  }
}
