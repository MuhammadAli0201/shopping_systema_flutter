import 'package:asg12_shoping_system/Modules/Controller/CartController.dart';
import 'package:asg12_shoping_system/core/Constants/Colors.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/ReusableText.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/ReusableTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlipScreen extends StatelessWidget {
  var controller = Get.put(CartController());
  SlipScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ReusableText(
          text: "Done",
          color: secondaryColor,
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: secondaryColor),
        actions: [
          ReusableTextButton(
            text: "TOTAL: ${controller.TotalPrice().toString()}",
            textcolor: primaryColor,
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          children: [
            Container(
                height: 30,
                width: double.infinity,
                color: primaryColor,
                child: Center(
                    child: ReusableText(
                  text: "Your Items Are",
                  color: secondaryColor,
                ))),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.cart.cartProducts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                      text:
                                          "Name: ${controller.cart.cartProducts[index].product!.title}"),
                                  ReusableText(
                                      text:
                                          "Price: ${controller.cart.cartProducts[index].product!.price}"),
                                  ReusableText(
                                      text:
                                          "Quantity: ${controller.cart.cartProducts[index].productCount}"),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      ReusableText(
                                        text: "Total Price: ",
                                        fontSize: 15,
                                        color: secondaryColor,
                                      ),
                                      ReusableText(
                                        text: controller.GetSingleProductPrice(
                                                index)
                                            .toString(),
                                        color: secondaryColor,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
