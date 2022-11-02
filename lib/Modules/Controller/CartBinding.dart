import 'package:asg12_shoping_system/Modules/Controller/CartController.dart';
import 'package:asg12_shoping_system/Modules/Controller/HomeController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class CartBinding implements Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut(() => CartController());
  }
}