import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_test/controllers/cart_controller.dart';
import 'package:product_test/controllers/shopping_controller.dart';
import 'package:product_test/glob.dart';

class CartPage extends StatelessWidget {
  // const ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Сагс"),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Image.network(
            //   "https://icons.iconarchive.com/icons/custom-icon-design/pretty-office-11/512/shop-icon.png",
            //   width: 80,
            //   height: 80,
            //   fit: BoxFit.fitWidth,
            // ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GetX<CartController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: lightGray,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x320E151B),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Hero(
                              tag: 'ControllerImage',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                        '${controller.cartItems[index].brand}'),
                                  ),
                                  // Text(
                                  //   '\$${controller.products[index].price}',
                                  // ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      '${controller.cartItems[index].category}',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '\₮${controller.cartItems[index].price}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ElevatedButton.icon(
                                    onPressed: () {
                                      cartController.removeCart(
                                          controller.cartItems[index].id);
                                      if (controller.count < 1) {
                                        Navigator.pop(context);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 18,
                                      // color: Colors.green,
                                    ),
                                    label: Text("Устгах")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Нийт үнэ:\₮ ${controller.totalPrice}',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            );
          }),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
