import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/network/error_message_model.dart';
import 'package:e_commerce_app/core/utils/shared_preferences.dart';
import 'package:e_commerce_app/home_module/data_layer/models/add_or_del_favourite_model.dart';
import 'package:e_commerce_app/home_module/data_layer/models/categories_model.dart';
import 'package:e_commerce_app/home_module/data_layer/models/get_favourite_model.dart';
import 'package:e_commerce_app/home_module/data_layer/models/home_model.dart';
import 'package:e_commerce_app/home_module/data_layer/models/products_model.dart';

import '../../../core/utils/constants.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHomeData();
  Future<List<CategoriesModel>> getCategories();
  Future<List<ProductsModel>> getCategoriesDetails({required int categoryId});
  Future<List<GetFavouriteModel>> getFavourites();
  Future<AddOrDeleteFavouriteModel> addOrDeleteFavourite(
      {required int productId});
  Future<ProductsModel> getProductDeatils({required int productId});
  Future<List<ProductsModel>> searchProduct({required String text});
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  Dio? dio;
  HomeRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'lang': SharedPreference.getData(key: 'language'),
          'Authorization': SharedPreference.getData(key: 'token',),
          'Content-Type': 'application/json',
        });
    dio = Dio(options);
  }
  @override
  Future<AddOrDeleteFavouriteModel> addOrDeleteFavourite(
      {required int productId}) async {
    Response response = await dio!.post(AppConstants.favorites,queryParameters: {
      'product_id':productId,
    });
   // debugPrint('Get Add or delete favourite ${response.data}');
    if (response.data['status']) {
      return AddOrDeleteFavouriteModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    Response response = await dio!.get(AppConstants.category);
   // debugPrint('Get categories ${response.data}');
    return List<CategoriesModel>.from((response.data['data']['data'] as List)
        .map((category) => CategoriesModel.fromJson(category))
        .toList());
  }

  @override
  Future<List<ProductsModel>> getCategoriesDetails(
      {required int categoryId}) async {
    Response response = await dio!.get('${AppConstants.category}/$categoryId');
   // debugPrint('Get Categories details ${response.data}');
    if (response.data['status']) {
      return List<ProductsModel>.from((response.data['data']['data'])
          .map((categoryDetails) => ProductsModel.fromJson(categoryDetails))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<GetFavouriteModel>> getFavourites() async {
    Response response = await dio!.get(AppConstants.favorites);
   // debugPrint('Get Favourite ${response.data}');
    if (response.data['status']) {
      return List<GetFavouriteModel>.from(
          (response.data['data']['data'] as List)
              .map((favourites) => GetFavouriteModel.fromJson(favourites))
              .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<HomeModel> getHomeData() async {
    Response response = await dio!.get(AppConstants.home);
    //debugPrint('Get Home ${response.data}');
    return HomeModel.fromJson(response.data['data']);
  }

  @override
  Future<ProductsModel> getProductDeatils({required int productId}) async {
    Response response = await dio!.get('${AppConstants.products}/$productId');
    //debugPrint('Get Products details ${response.data}');
    if (response.data['status']) {
      return ProductsModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ProductsModel>> searchProduct({required String text}) async {
    Response response = await dio!.post(AppConstants.search,
    queryParameters: {
      'text':text,
    });
   // debugPrint('Get Search Product ${response.data}');
    if (response.data['status']) {
      return List<ProductsModel>.from((response.data['data']['data'] as List)
          .map((product) => ProductsModel.fromJson(product))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
