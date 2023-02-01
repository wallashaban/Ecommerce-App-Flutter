import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';

class ProductsModel extends Products {
  const ProductsModel({
     super.id = 80,
     super.price = 34.9,
     super.oldPrice = 90.0,
     super.discount=0,
     super.image='',
     super.name='',
     super.description='',
     super.inFavourite=false,
     super.inCart=false,
     super.images= const[],
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      price: json['price'].toDouble(),
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      inFavourite: json['in_favorites'],
      inCart: json['in_cart'],
      images:List<String>.from(json['images']).map((image) => image).toList() ,
    );
  }
}
