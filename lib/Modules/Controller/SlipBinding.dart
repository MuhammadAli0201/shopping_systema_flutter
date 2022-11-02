import 'package:asg12_shoping_system/Modules/Controller/CartController.dart';
import 'package:get/get.dart';

class SlipBinding extends Bindings
{
  void dependencies()
  {
    Get.lazyPut(() => CartController());
  }
}