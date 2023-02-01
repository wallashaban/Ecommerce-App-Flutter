import 'package:e_commerce_app/home_module/domain_layer/entities/fav_product.dart';
import 'package:equatable/equatable.dart';

class Favourites extends Equatable {
  final int id;
  final FavProduct favProduct;
  const Favourites({
    required this.id,
    required this.favProduct,
  });

  @override
  List<Object?> get props => [
    id,
    favProduct,
  ];
}
