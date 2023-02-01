// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/home_module/data_layer/models/banners_model.dart';
import 'package:e_commerce_app/home_module/data_layer/models/products_model.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/home.dart';

class HomeModel extends Home {
  HomeModel({
    super.banners = const [],
    super.products = const [],
  });
  HomeModel.fromJson(Map<String, dynamic> json) {
    banners = List<BannersModel>.from(
      json['banners'].map((banner) => BannersModel.fromJson(banner)),
    );
    products = List.from(
      json['products'].map((product) => ProductsModel.fromJson(product)),
    );
  }
}
