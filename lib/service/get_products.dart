import 'package:product_test/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  //static var client = http.Client();
  static Future<List<Product>?> fetchProducts() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=colourpop'));

    // print(response.body);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return ProductFromJson(jsonString);
    } else {
      return null;
    }
  }
}
