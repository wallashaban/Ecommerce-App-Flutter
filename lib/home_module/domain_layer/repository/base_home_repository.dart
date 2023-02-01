import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/add_or_del_favourite.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/categories.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/favourites.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/home.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';

abstract class BaseHomeRepository {
 Future<Home> getHomeData();
 Future<List<Categories>> getCategories();
 Future<Either<Failure,List<Products>>> getCategoriesDetails({required int categoryId});
  Future<Either<Failure,List<Favourites>>> getFavourites();
  Future<Either<Failure,AddOrDeleteFavourite>> addOrDeleteFavourite({required int productId});
  Future<Either<Failure,Products>> getProductDeatils({required int productId});
  Future<Either<Failure,List<Products>>> searchProduct({required String text});
}
