import 'package:asg12_shoping_system/Modules/Controller/HomeController.dart';
import 'package:asg12_shoping_system/Modules/Controller/SignInController.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut(() => HomeController());
  }
}