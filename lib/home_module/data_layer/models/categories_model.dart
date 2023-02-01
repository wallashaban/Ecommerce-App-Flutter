import 'package:e_commerce_app/home_module/domain_layer/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
