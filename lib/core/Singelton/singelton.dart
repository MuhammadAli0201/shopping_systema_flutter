import 'package:asg12_shoping_system/Modules/Model/CartProduct.dart';

class Singleton
{
 static Singleton instance=Singleton._initial();
  Singleton._initial();

  List<CartProduct>? cartSingleton;

}