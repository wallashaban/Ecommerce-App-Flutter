import 'package:e_commerce_app/home_module/domain_layer/entities/fav_product.dart';

class FavProductModel extends FavProduct {
  const FavProductModel(
      {required super.id,
      required super.price,
      required super.oldPrice,
      required super.discount,
      required super.image,
      required super.name,
      required super.description});

  factory FavProductModel.fromJson(Map<String, dynamic> json) {
    return FavProductModel(
      id: json['id'],
      price: json['price'].toDouble(),
      oldPrice: json['old_price'].toDouble(),
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
