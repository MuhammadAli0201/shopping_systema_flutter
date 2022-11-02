import 'package:get/get.dart';

class Product { 
  int? id;
  String? title;
  int? price;
  RxInt? availableStock;

  Product({this.id,this.title, this.price, this.availableStock});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    availableStock = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.availableStock;
    return data;
  }
}