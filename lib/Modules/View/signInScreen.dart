import 'package:asg12_shoping_system/Modules/Controller/SignInController.dart';
import 'package:asg12_shoping_system/Modules/Model/User.dart';
import 'package:asg12_shoping_system/core/Constants/Colors.dart';
import 'package:asg12_shoping_system/core/Constants/SizedBox.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/BigTextButton.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/ReusableText.dart';
import 'package:asg12_shoping_system/core/ReusableWidgets/ReusableTextField.dart';
import 'package:asg12_shoping_system/core/routes/NamedRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<signInController> {
TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ReusableText(
            text: "Sign In",
            color: secondaryColor,
            fontSize: 25,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableTextFormField(
              controller: emailController,
              hintText: "E-mail",
            ),
            mediumSizedBox,
            ReusableTextFormField(
              controller: passwordController,
              hintText: "Password",
            ),
            smallSizedBox,
            bigTextButton(
              onPressed: () {
                if(emailController.text.isEmpty||passwordController.text.isEmpty)
                {
                  Get.snackbar("Alert", "Kindly Enter All Feilds");
                }
                final check = controller.signIn(User(
                    email: emailController.text.obs,
                    password: passwordController.text.obs));
                print(check);
                if (check == true) {
                  Get.toNamed(Routes.HomeScreen);
                } else {
                  Get.snackbar(
                    
                    "Alert", "Unable to Sign In");
                }
              },
              text: "Sign In",
              backgroundColor: primaryColor,
              textcolor: secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}