import 'package:e_commerce_app/home_module/data_layer/models/fav_product_model.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/favourites.dart';

class GetFavouriteModel extends Favourites {
 const GetFavouriteModel({
    required super.id,
    required super.favProduct,
  });

  factory GetFavouriteModel.fromJson(Map<String, dynamic> json) {
    return GetFavouriteModel(
      id: json['id'],
      favProduct: FavProductModel.fromJson(json['product']),
    );
  }
}
