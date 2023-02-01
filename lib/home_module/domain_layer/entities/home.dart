// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/home_module/domain_layer/entities/banners.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';
import 'package:equatable/equatable.dart';

class Home extends Equatable{
   List<Banners> banners;
   List<Products> products;
  Home({
     this.banners = const[],
     this.products=const[],
  });
  
  @override
  List<Object?> get props => [
    banners,
    products,
  ];
}
