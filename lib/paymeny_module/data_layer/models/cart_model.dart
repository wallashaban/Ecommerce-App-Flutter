import 'package:e_commerce_app/home_module/data_layer/models/products_model.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
     super.id=1,
     super.quantity=1,
     super.product = const ProductsModel(),
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      quantity: json['quantity'],
      product: ProductsModel.fromJson(json['product']),
    );
  }
}
