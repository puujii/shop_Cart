import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_test/controllers/cart_controller.dart';
import 'package:product_test/controllers/shopping_controller.dart';
import 'package:product_test/glob.dart';
import 'package:product_test/views/cart_page.dart';

class ShoppingPage extends StatelessWidget {
  // const ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  void _cartList(BuildContext ctx) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: ctx,
      builder: (_) {
        return DraggableScrollableSheet(
            initialChildSize: 0.95, //set this as you want
            maxChildSize: 0.95, //set this as you want
            minChildSize: 0.95, //set this as you want
            expand: true,
            builder: (context, scrollController) {
              return CartPage(); //whatever you're returning, does not have to be a Container
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _cartList(context);
          },
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              'Сагс: ${controller.count.toString()}',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            );
          })),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
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
                                          '${controller.products[index].brand}'),
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
                                        '${controller.products[index].category}',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '\₮${controller.products[index].price}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        cartController.addToCart(
                                            controller.products[index]);
                                      },
                                      icon: Icon(
                                        Icons.shopping_basket,
                                        size: 18,
                                        // color: Colors.green,
                                      ),
                                      label: Text("Сагс")),
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
                    color: Colors.white),
              );
            }),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
