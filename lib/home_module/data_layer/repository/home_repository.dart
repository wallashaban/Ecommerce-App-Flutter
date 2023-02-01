import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/home_module/data_layer/data_source/home_remote_data_source.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/favourites.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/home.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/categories.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/add_or_del_favourite.dart';
import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';

class HomeRepository implements BaseHomeRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, AddOrDeleteFavourite>> addOrDeleteFavourite({required int productId})async {
    try {
      final result = await baseHomeRemoteDataSource.addOrDeleteFavourite(productId: productId);
      return right(result);
    } on ServerException catch (failur) {
      return left(ServerFailure(message: failur.errorMessageModel.message));
    }
  }

  @override
  Future<List<Categories>> getCategories() async {
    final result = await baseHomeRemoteDataSource.getCategories();
    return result;
  }

  @override
  Future<Either<Failure, List<Products>>> getCategoriesDetails(
      {required int categoryId}) async {
    try {
      final result = await baseHomeRemoteDataSource.getCategoriesDetails(
          categoryId: categoryId);
      return right(result);
    } on ServerException catch (failur) {
      return left(ServerFailure(message: failur.errorMessageModel.message));
    }
  }

  @override
 Future<Either<Failure,List<Favourites>>> getFavourites() async{
     try {
      final result = await baseHomeRemoteDataSource.getFavourites();
      return right(result);
    } on ServerException catch (failur) {
      return left(ServerFailure(message: failur.errorMessageModel.message));
    }
  }

  @override
  Future<Home> getHomeData() async {
    final result = await baseHomeRemoteDataSource.getHomeData();
   // debugPrint(result.toString());
    return result;
  }

  @override
  Future<Either<Failure,Products>> getProductDeatils({required int productId})async {
     try {
      final result = await baseHomeRemoteDataSource.getProductDeatils(productId: productId);
      return right(result);
    } on ServerException catch (failur) {
      return left(ServerFailure(message: failur.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure,List<Products>>> searchProduct({required String text})async {
    try {
      final result = await baseHomeRemoteDataSource.searchProduct(text: text);
      return right(result);
    } on ServerException catch (failur) {
      return left(ServerFailure(message: failur.errorMessageModel.message));
    }
  }
}
