import 'package:e_commerce_app/paymeny_module/domain_layer/entities/update_cart.dart';

class UpdateCartModel extends UpdateCart {
  const UpdateCartModel({
     super.status = false,
     super.message ='',
     super.quantity='',
     //super.cartTotal =const CarTotalModel(subTotal: 76,total: 78),
  });
  factory UpdateCartModel.fromJson(Map<String, dynamic> json) {
    return UpdateCartModel(
      status: json['status'],
      message: json['message'],
      quantity: json['data']['cart']['quantity'],
    //  cartTotal: json['data'],
    );
  }
}



