import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order.dart';

class GetOrdersModel extends GetOrder {
  const GetOrdersModel({
    required super.id,
    required super.total,
    required super.date,
    required super.status,
  });

  factory GetOrdersModel.fromJson(Map<String, dynamic> json) {
    return GetOrdersModel(
      id: json['id'],
      total: json['total'].toDouble(),
      date: json['date'],
      status: json['status'],
    );
  }
}
