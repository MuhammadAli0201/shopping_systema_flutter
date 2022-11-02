import 'package:asg12_shoping_system/Modules/Model/Cart.dart';
import 'package:asg12_shoping_system/Modules/Model/CartProduct.dart';
import 'package:asg12_shoping_system/core/Singelton/singelton.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  Cart cart = Cart();
  @override
  void AddToCart() {
    cart.cartProducts=Singleton.instance.cartSingleton!;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    AddToCart();
  }
  void increment(int index) {
    if (cart.cartProducts[index].productCount!.value > 0 &&
        cart.cartProducts[index].product!.availableStock! > 0) {
      cart.cartProducts[index].productCount?.value++;
      cart.cartProducts[index].product!.availableStock! - 1;
    }
  }   

  void decrement(int index) {
    if (cart.cartProducts[index].productCount!.value > 1) {
      cart.cartProducts[index].productCount?.value--;
      cart.cartProducts[index].product!.availableStock! + 1;
    }
  }
  int GetSingleProductPrice(int index)
  {
    return cart.cartProducts[index].product!.price!*cart.cartProducts[index].productCount!.value;

  }
  RxInt? GetProductCount(int index) {
    return cart.cartProducts[index].productCount;
  }
  RxInt TotalPrice()
  {
    RxInt totalPrice=0.obs;
    for(int i=0;i<cart.cartProducts.length;i++)
    {
      final x=cart.cartProducts[i].product!.price!;
      final y=cart.cartProducts[i].productCount!.value;
      final z=x*y;
      totalPrice=(totalPrice+z);
    }
  return totalPrice;
  }
}
