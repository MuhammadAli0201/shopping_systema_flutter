import 'package:asg12_shoping_system/Modules/Model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/Singelton/singelton.dart';
import '../../core/routes/NamedRoutes.dart';
import '../Model/CartProduct.dart';

class HomeController extends GetxController {
  List<CartProduct> cartList = <CartProduct>[].obs;
  late TextEditingController titleController;
  late TextEditingController priceController; 
  late TextEditingController stockController;
  List<String> onPressFlag = ["", "", ""].obs;
  var isAddProductFlag = true.obs;
  RxList<Product> productList = <Product>[
    Product(id: 0, title: "Nestle Water", price: 30, availableStock: 50.obs),
    Product(id: 1, title: "Nimko", price: 10, availableStock: 10.obs),
    Product(id: 2, title: "lays", price: 40, availableStock: 100.obs),
  ].obs;

  @override
  void onInit() {
    titleController = TextEditingController();
    priceController = TextEditingController();
    stockController = TextEditingController();

    super.onInit();
  }

 
  void refreshController(){
        titleController.text = '';
    priceController.text = '';
    stockController.text = '';
  }

  void UpdateProduct(int index) {
     print("-----------------UpdateProduct-------------");
    Product pro = Product(
        id: productList[index].id,
        title: titleController.text,
        price: priceController.text == "" ? 0 : int.parse(priceController.text),
        availableStock: stockController.text == ""
            ? 0.obs
            : int.parse(stockController.text).obs);
    productList[index] = pro;
    Get.back();
  }

  void DeleteItem(int index) {
    cartList.removeWhere((element) {
      return element.product?.id == productList[index].id;
    });
    productList.removeAt(index);
    onPressFlag.removeAt(index);
  }

  void navCartScreen() {
    Singleton.instance.cartSingleton = cartList;
    Get.toNamed(Routes.CartScreen);
  }

  void AddToCart(int index) {
    CartProduct cartProduct =
        CartProduct(product: productList[index], productCount: 1.obs);
    cartList.add(cartProduct);
    cartList[index].product?.availableStock?.value--;
    onPressFlag[index] = 'clicked';
  }

  int? GetLastId() {
    int lastID;
    if (productList.isEmpty == true) {
      lastID = 0;
    } else {
      lastID = productList.last.id!;
      lastID = lastID + 1;
    }
    return lastID;
  }

  AddProduct() {
    Product pro = Product(
        id: GetLastId(),
        title: titleController.text,
        price: priceController.text == "" ? 0 : int.parse(priceController.text),
        availableStock: stockController.text == ""
            ? 0.obs
            : int.parse(stockController.text).obs);
    productList.add(pro);
    onPressFlag.add("");
    Get.back();
  }
   void onupdate(Product data) {
  print("-----------------onupdate-------------");
    titleController=TextEditingController(text:data.title);
    print(titleController.text);
    priceController.text=data.price.toString();
    stockController.text=data.availableStock.toString();
    print("object update");
    

  }
}
