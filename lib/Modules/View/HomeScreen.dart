import 'package:asg12_shoping_system/Modules/Controller/HomeController.dart';
import 'package:asg12_shoping_system/Modules/View/ModalBottomSheet.dart';
import 'package:asg12_shoping_system/core/Constants/Colors.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/ReusableText.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/ReusableTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.isAddProductFlag.value = true;
          Get.bottomSheet(ModalBottomSheets(
            onPressed: () {
              controller.AddProduct();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: ReusableText(
          text: "All Data",
          fontSize: 20,
          color: secondaryColor,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Obx(() {
            return ReusableTextButton(
              onPressed: () {
                controller.navCartScreen();
              },
              backgroundColor: primaryColor,
              text: "Cart(${controller.cartList.length})",
            );
          })
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              var item=controller.productList[index];
              
              return Card(
                child: Slidable(
                  startActionPane:
                      ActionPane(motion: ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (val) {
                        controller.DeleteItem(index);
                      },
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (val) {
                        print("object");
                        controller.onupdate(item);
                        Get.bottomSheet(ModalBottomSheets(
                          onPressed: () {
                            print("af");
                            
                            controller.UpdateProduct(index);
                          },
                          index: index,
                        ));
                      },
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Update',
                    ),
                  ]),
                  child: ListTile(
                    leading: ReusableText(
                        text: controller.productList[index].title.toString()),
                    title: Container(
                      width: 100,
                      child: Row(
                        children: [
                          ReusableText(
                            text: "Price: ",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: secondaryColor,
                          ),
                          ReusableText(
                            text:
                                controller.productList[index].price.toString(),
                            color: secondaryColor,
                          ),
                        ],
                      ),
                    ),
                    subtitle: Container(
                      width: 100,
                      child: Row(
                        children: [
                          ReusableText(
                            text: "Stock: ",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: secondaryColor,
                          ),
                          Obx(() {
                            return ReusableText(
                              text: controller.productList[index].availableStock
                                  .toString(),
                              color: secondaryColor,
                            );
                          }),
                        ],
                      ),
                    ),
                    trailing: Container(
                      width: 50,
                      child: Row(
                        children: [
                          Obx((() {
                            return IconButton(
                                onPressed: controller.onPressFlag[index] == ""
                                    ? () {
                                        controller.AddToCart(index);
                                      }
                                    : () {},
                                icon: Icon(Icons.shopping_cart));
                          }))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
