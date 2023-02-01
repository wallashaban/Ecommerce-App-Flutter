import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_from_cart.dart';

class AddOrDeleteFromCartModel extends AddOrDeleteFromCart {
  const AddOrDeleteFromCartModel({
    required super.status,
    required super.message,
  });

 factory  AddOrDeleteFromCartModel.fromJson(Map<String, dynamic> json) {
    return AddOrDeleteFromCartModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
