import 'package:asg12_shoping_system/Modules/Controller/CartController.dart';
import 'package:asg12_shoping_system/Modules/View/SlipScreen.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/BigTextButton.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/ReusableTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/Constants/Colors.dart';
import '../../core/ReusableWidgets/ReusableText.dart';

class CartScreen extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: ReusableText(
          text: "Cart",
          fontSize: 25,
          color: secondaryColor,
        ),
        actions: [
          Obx(() {
            return ReusableTextButton(
              text: "Total: ${controller.TotalPrice()}",
              textcolor: primaryColor,
              onPressed: null,
            );
          })
        ],
        centerTitle: true,
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(child: Obx(() {
                return ListView.builder(
                    itemCount: controller.cart.cartProducts.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ReusableText(
                                            text: "Name: ",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: secondaryColor,
                                          ),
                                          ReusableText(
                                            text: controller
                                                .cart
                                                .cartProducts[index]
                                                .product
                                                ?.title
                                                .toString(),
                                            color: secondaryColor,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          ReusableText(
                                            text: "Price: ",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: secondaryColor,
                                          ),
                                          ReusableText(
                                            text: controller
                                                .cart
                                                .cartProducts[index]
                                                .product
                                                ?.price
                                                .toString(),
                                            color: secondaryColor,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          ReusableText(
                                            text: "Stock: ",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: secondaryColor,
                                          ),
                                          Obx(
                                            () => ReusableText(
                                              text: controller
                                                  .cart
                                                  .cartProducts[index]
                                                  .product!
                                                  .availableStock
                                                  .toString(),
                                              color: secondaryColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              iconSize: 15,
                                              onPressed: () {
                                                controller.increment(index);
                                                controller.TotalPrice();
                                              },
                                              icon: Icon(Icons.add)),
                                          Container(
                                              child: Obx(
                                            () => ReusableText(
                                              text: controller.GetProductCount(
                                                      index)
                                                  .obs
                                                  .toString(),
                                            ),
                                          )),
                                          IconButton(
                                              iconSize: 15,
                                              onPressed: () {
                                                controller.decrement(index);

                                                controller.TotalPrice();
                                              },
                                              icon: Icon(Icons.remove)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableText(
                                  text: "Total Price: ",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: primaryColor,
                                ),
                                Obx(
                                  () => ReusableText(
                                    text:
                                        controller.GetSingleProductPrice(index)
                                            .toString(),
                                    color: secondaryColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ));
                    });
              })),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: bigTextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SlipScreen();
              }));
            },
            text: "BUY",
            backgroundColor: primaryColor,
            textcolor: secondaryColor,
          )),
    );
  }
}
