import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/Constants/Colors.dart';
import '../../core/Constants/SizedBox.dart';
import '../../core/ReusableWidgets/BigTextButton.dart';
import '../../core/ReusableWidgets/ReusableTextField.dart';
import '../Controller/HomeController.dart';

class ModalBottomSheets extends GetView<HomeController> {
  int? index;
  Function()? onPressed;
  ModalBottomSheets({
    Key? key,
    this.index,
    this.onPressed,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableTextFormField(
              controller: controller.titleController,
              hintText: "Title",
            ),
            smallSizedBox,
            ReusableTextFormField(
              controller: controller.priceController,
              hintText: "Price",
            ),
            smallSizedBox,
            ReusableTextFormField(
              controller: controller.stockController,
              hintText: "Quantity",
            ),
            mediumSizedBox,
            Container(
              child: bigTextButton(
                    onPressed:onPressed,
                    text: "Submit",
                    backgroundColor: primaryColor,
                    textcolor: secondaryColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
