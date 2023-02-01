import 'package:equatable/equatable.dart';

import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';

class CartTotal extends Equatable {
  final double subTotal;
  final double total;
  final List<Cart> cart;
  const CartTotal({
   required this.subTotal,
   required this.total,
   required this.cart,
  });
  @override
  List<Object?> get props => [
        subTotal,
        total,
        cart,
      ];
}


class Cart extends Equatable {
 final int id;
 final int quantity;
 final  Products product;
 const Cart({
    required this.id,
    required this.quantity,
    required this.product,
  });
  @override
  List<Object?> get props => [
    id,
    quantity,
    product,
  ];
}
