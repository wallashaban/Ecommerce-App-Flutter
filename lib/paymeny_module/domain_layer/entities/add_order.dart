import 'package:equatable/equatable.dart';

class AddOrder extends Equatable {
  final bool status;
  final String message;
 // final OrderData data;
  const AddOrder({
    required this.status,
    required this.message,
   // required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}

class OrderData extends Equatable {
  final String paymentMethod;
  final double cost;
  final double discount;
  final double total;
  final int id;
  final String? date;
  final String? status;

  const OrderData({
    required this.paymentMethod,
    required this.cost,
    required this.discount,
    required this.total,
    required this.id,
    required this.date,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        cost,
        discount,
        paymentMethod,
        total,
      ];
}
