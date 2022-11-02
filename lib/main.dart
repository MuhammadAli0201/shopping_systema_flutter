import 'package:asg12_shoping_system/core/routes/NamedRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: Routes.HomeScreen,
      getPages: AllRoutes.allRoutes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
