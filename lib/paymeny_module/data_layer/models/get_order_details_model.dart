import 'package:e_commerce_app/paymeny_module/data_layer/models/add_order_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/get_address_model.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order_details.dart';

class GetOrderDetailsModel extends GetOrderDetails {
  const GetOrderDetailsModel({
     super.data =const OrderDataModel(paymentMethod: 'paymentMethod', cost: 990, discount: 89, total: 98, id: 1, date: 'date', status: 'status'),
     super.address = const GetAddressModel(city: '',details: '',id: 1,latitude: 09,longitude: 90,name: '',
     notes: '',regoin: ''),
     super.orderProducts = const [],
  });

  factory GetOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return GetOrderDetailsModel(
      data: OrderDataModel.fromJson(json['data']),
      address: GetAddressModel.fromJson(json['data']['address']),
      orderProducts:List<OrderProductsModel>.from(
        json['data']['products'].map((product) => OrderProductsModel.fromJson(product)),
      ),
    );
  }
}

class OrderProductsModel extends OrderProducts {
  const OrderProductsModel({
    required super.id,
    required super.quantity,
    required super.price,
    required super.name,
    required super.image,
  });

  factory OrderProductsModel.fromJson(Map<String, dynamic> json) {
    return OrderProductsModel(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      name: json['name'],
      image: json['image'],
    );
  }
}
