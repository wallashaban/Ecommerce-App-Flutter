import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_order.dart';

class AddOrderModel extends AddOrder {
  const AddOrderModel({
     super.status = false,
     super.message = '',
    // super.data,
  });
  factory AddOrderModel.fromJson(Map<String, dynamic> json) {
    return AddOrderModel(
      status: json['status'],
      message: json['message'],
     /*  data: OrderDataModel.fromJson(
        json['data'],
      ), */
    );
  }
}

class OrderDataModel extends OrderData {
  const OrderDataModel({
    required super.paymentMethod,
    required super.cost,
    required super.discount,
    required super.total,
    required super.id,
    required super.date,
    required super.status,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) {
    return OrderDataModel(
      paymentMethod: json['payment_method'],
      cost: json['cost'].toDouble(),
      discount: json['discount'].toDouble(),
      total: json['total'].toDouble(),
      id: json['id'],
      date: json['date'],
      status: json['status'],
    );
  }
}
