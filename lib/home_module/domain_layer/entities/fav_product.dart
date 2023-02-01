import 'package:equatable/equatable.dart';

class FavProduct extends Equatable{
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
 const FavProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description ,
  });
  
  @override
  List<Object?> get props => [
    id,
    price,
    oldPrice,
    image,
    name,
    description,
    discount,
  ];
}
