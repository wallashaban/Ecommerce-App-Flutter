
import 'package:e_commerce_app/home_module/domain_layer/entities/banners.dart';

class BannersModel extends Banners {
  const BannersModel({
    required super.id,
    required super.image,
  });
  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
      id: json['id'],
      image: json['image'],
    );
  }
}
