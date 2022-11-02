import 'package:asg12_shoping_system/Modules/Controller/SignInController.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut(() => signInController());
  }
}