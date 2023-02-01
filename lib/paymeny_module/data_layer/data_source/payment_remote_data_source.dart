import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/network/error_message_model.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/add_or_del_from_cart_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/add_or_del_or_update_address_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/add_order_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/cart_total_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/get_order_details_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/get_order_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/update_cart_model.dart';

import '../../../core/utils/shared_preferences.dart';
import '../models/get_address_model.dart';

abstract class BasePaymentRemoteDataSource {
  Future<CarTotalModel> getCart();
  Future<UpdateCartModel> updateCart(
      {required int cartId, required int quantity});
  Future<AddOrDeleteFromCartModel> addOrDeleteFromCart(
      {required int productId});

  ///Address Functions
  Future<List<GetAddressModel>> getAddress();
  Future<AddOrDeleteOrUpdateAddressModel> addAddress({
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  });
  Future<AddOrDeleteOrUpdateAddressModel> updateAddress({
    required int addressId,
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  });

  Future<AddOrDeleteOrUpdateAddressModel> deleteAddress(
      {required int addressId});

  ///Order Functions
  Future<List<GetOrdersModel>> getOrders();
  Future<AddOrderModel> addOrder({
    required int orderId,
    required int paymentMethod,
  });
  Future<GetOrderDetailsModel> getOrderDetails({
    required int orderId,
  });
  Future<AddOrderModel> canselOrder({
    required int orderId,
  });
}

class PaymentRemoteDataSource extends BasePaymentRemoteDataSource {
  Dio? dio;
  PaymentRemoteDataSource() {
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
  Future<AddOrDeleteFromCartModel> addOrDeleteFromCart(
      {required int productId}) async {
    Response response = await dio!.post(AppConstants.carts, queryParameters: {
      'product_id': productId,
    });
    // debugPrint('add cart ${response.data}');
    if (response.data['status']) {
      return AddOrDeleteFromCartModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CarTotalModel> getCart() async {
    Response response = await dio!.get(
      AppConstants.carts,
    );
    // debugPrint('get cart ${response.data}');
    if (response.data['status']) {
      return CarTotalModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<UpdateCartModel> updateCart(
      {required int cartId, required int quantity}) async {
    Response response =
        await dio!.put('${AppConstants.carts}/$cartId', queryParameters: {
      'quantity': quantity,
    });
   // debugPrint('update cart ${response.data}');

    if (response.data['status']) {
      return UpdateCartModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddOrderModel> addOrder({
    required int orderId,
    required int paymentMethod,
  }) async {
    Response response = await dio!.post(AppConstants.orders, queryParameters: {
      'address_id': orderId,
      'payment_method': paymentMethod,
      'use_points': false,
    });
     //debugPrint('Add order  ${response.data}');

    if (response.data['status']) {
      return AddOrderModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddOrderModel> canselOrder({
    required int orderId,
  }) async {
    Response response = await dio!
        .get('${AppConstants.orders}/$orderId/${AppConstants.cancel}');
    //  debugPrint('Cansel Order ${response.data}');

    if (response.data['status']) {
      return AddOrderModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddOrDeleteOrUpdateAddressModel> deleteAddress({
    required int addressId,
  }) async {
    Response response = await dio!.delete(
      '${AppConstants.address}/$addressId',
    );
    // debugPrint('Delete address ${response.data}');

    if (response.data['status']) {
      return AddOrDeleteOrUpdateAddressModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetOrderDetailsModel> getOrderDetails({required int orderId}) async {
    Response response = await dio!.get(
      '${AppConstants.orders}/$orderId',
    );
    // debugPrint('get order details ${response.data}');

    if (response.data['status']) {
      return GetOrderDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<GetOrdersModel>> getOrders() async {
    Response response = await dio!.get(
      AppConstants.orders,
    );
    //debugPrint('get Orders  ${response.data}');

    if (response.data['status']) {
      return List<GetOrdersModel>.from((response.data['data']['data'])
          .map(
            (orders) => GetOrdersModel.fromJson(orders),
          )
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddOrDeleteOrUpdateAddressModel> updateAddress({
    required int addressId,
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  }) async {
    Response response =
        await dio!.put('${AppConstants.address}/$addressId', queryParameters: {
      "name": name,
      "city": city,
      "region": regoin,
      "details": details,
      "latitude": latitude,
      "longitude": longitude,
      "notes": notes,
    });
    //debugPrint('update address ${response.data}');

    if (response.data['status']) {
      return AddOrDeleteOrUpdateAddressModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddOrDeleteOrUpdateAddressModel> addAddress({
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  }) async {
    Response response = await dio!.post(AppConstants.address, queryParameters: {
      "name": name,
      "city": city,
      "region": regoin,
      "details": details,
      "latitude": latitude,
      "longitude": longitude,
      "notes": notes,
    });
    // debugPrint('add address ${response.data}');

    if (response.data['status']) {
      return AddOrDeleteOrUpdateAddressModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<GetAddressModel>> getAddress() async {
    Response response = await dio!.get(AppConstants.address);
    //debugPrint('get address ${response.data}');

    if (response.data['status']) {
      return List<GetAddressModel>.from((response.data['data']['data'])
          .map(
            (cart) => GetAddressModel.fromJson(cart),
          )
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
