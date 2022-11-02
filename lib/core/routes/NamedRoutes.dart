import 'package:asg12_shoping_system/Modules/Controller/CartBinding.dart';
import 'package:asg12_shoping_system/Modules/Controller/HomeBinding.dart';
import 'package:asg12_shoping_system/Modules/Controller/SignInBinding.dart';
import 'package:asg12_shoping_system/Modules/View/CartScreen.dart';
import 'package:asg12_shoping_system/Modules/View/HomeScreen.dart';
import 'package:asg12_shoping_system/Modules/View/signInScreen.dart';
import 'package:get/get.dart';

class Routes
{
  static const String SignInScreen='/signInScreen';
  static const String HomeScreen='/homeScreen';
  static const String UpdateScreen='/UpdateScreen';
  static const String AddDataScreen='/AddDataScreen';
  static const String CartScreen='/CartScreen';
}

class AllRoutes
{
  static final allRoutes=[
    GetPage(name: Routes.SignInScreen, page: ()=>SignInScreen(),binding: SignInBinding()),
    GetPage(name: Routes.HomeScreen, page: ()=>HomeScreen(),
    binding: HomeBinding()
    ),
    GetPage(name: Routes.CartScreen, page: (){return CartScreen();},
    binding: CartBinding()
    ),
  ];
}