import 'package:asg12_shoping_system/Modules/Model/Product.dart';
import 'package:get/get.dart';

class CartProduct{
  RxInt? productCount;
  Product? product;
  
  CartProduct({this.productCount,this.product});
}