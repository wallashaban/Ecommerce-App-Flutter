import 'package:e_commerce_app/home_module/domain_layer/entities/add_or_del_favourite.dart';

class AddOrDeleteFavouriteModel extends AddOrDeleteFavourite {
  const AddOrDeleteFavouriteModel({
     super.status=false,
     super.message='',
  });

  factory AddOrDeleteFavouriteModel.fromJson(Map<String, dynamic> json) {
    return AddOrDeleteFavouriteModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
