
import 'package:e_commerce_app/paymeny_module/data_layer/models/cart_model.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/cart.dart';

class CarTotalModel extends CartTotal {
  const CarTotalModel({
    required super.subTotal,
    required super.total,
    required super.cart,
  });

  factory CarTotalModel.fromJson(Map<String, dynamic> json) {
    return CarTotalModel(
      subTotal: json['sub_total'].toDouble(),
      total: json['total'].toDouble(),
      cart: List<Cart>.from(json['cart_items'].map((cart)=>CartModel.fromJson(cart))),
    );
  }
}
