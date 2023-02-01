import 'package:equatable/equatable.dart';

import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/address.dart';

class GetOrderDetails extends Equatable {
  final OrderData data;
  final Address address;
  final List<OrderProducts> orderProducts;
  const GetOrderDetails({
    required this.data,
    required this.address,
    required this.orderProducts,
  });
  @override
  List<Object?> get props => [
    data,
    address,
    orderProducts,
  ];
}

class OrderProducts extends Equatable {
  final int id;
  final int quantity;
  final double price;
  final String name;
  final String image;
  const OrderProducts({
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        quantity,
        price,
        name,
        image,
      ];
}
