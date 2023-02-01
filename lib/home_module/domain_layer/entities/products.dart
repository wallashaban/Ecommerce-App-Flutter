import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final int id;
  final double price;
  final dynamic oldPrice;
  final int? discount;
  final String image;
  final String name;
  final String description;
  final bool inFavourite;
  final bool inCart;
  final List<String> images;
  const Products({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavourite,
    required this.inCart,
    required this.images,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        images,
        description,
        price,
        oldPrice,
        discount,
        inCart,
        inFavourite,
      ];
}
