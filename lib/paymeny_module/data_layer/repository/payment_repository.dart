import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/data_source/payment_remote_data_source.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_or_update_address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order_details.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/update_cart.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/cart.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_from_cart.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';

class PaymentRepository implements BasePaymentRepository {
  final BasePaymentRemoteDataSource basePaymentRemoteDataSource;

  PaymentRepository(this.basePaymentRemoteDataSource);
  @override
  Future<Either<Failure, AddOrDeleteFromCart>> addOrDelteFromCart(
      {required int productId}) async {
    try {
      final result = await basePaymentRemoteDataSource.addOrDeleteFromCart(
          productId: productId);
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CartTotal>> getCart() async {
    try {
      final result = await basePaymentRemoteDataSource.getCart();
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UpdateCart>> updateCart(
      {required int cartId, required int quantity}) async {
    try {
      final result = await basePaymentRemoteDataSource.updateCart(
          cartId: cartId, quantity: quantity);
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AddOrDeleteOrUpdateAddress>> addAddress({
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  }) async {
    try {
      final result = await basePaymentRemoteDataSource.addAddress(
          name: name,
          regoin: regoin,
          city: city,
          details: details,
          notes: notes,
          longitude: longitude,
          latitude: latitude);
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AddOrDeleteOrUpdateAddress>> deleteAddress(
      {required int addressId}) async {
    try {
      final result =
          await basePaymentRemoteDataSource.deleteAddress(addressId: addressId);
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Address>>> getAddress() async {
    try {
      final result = await basePaymentRemoteDataSource.getAddress();
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AddOrDeleteOrUpdateAddress>> updateAddress({
    required int addressId,
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  }) async {
    try {
      final result = await basePaymentRemoteDataSource.updateAddress(
        addressId: addressId,
        name: name,
        regoin: regoin,
        city: city,
        details: details,
        notes: notes,
        longitude: longitude,
        latitude: latitude,
      );
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AddOrder>> addOrder(
      {required int orderId, required int paymentMethod}) async {
    try {
      final result = await basePaymentRemoteDataSource.addOrder(
        orderId: orderId,
        paymentMethod: paymentMethod,
      );
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, GetOrderDetails>> getOrderDetails(
      {required int orderId}) async {
    try {
      final result =
          await basePaymentRemoteDataSource.getOrderDetails(orderId: orderId);
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<GetOrder>>> getOrders() async {
    try {
      final result = await basePaymentRemoteDataSource.getOrders();
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AddOrder>> canselOrder({required int orderId}) async {
    try {
      final result =
          await basePaymentRemoteDataSource.canselOrder(orderId: orderId);
      return right(result);
    } on ServerException catch (failur) {
      return left(
        ServerFailure(
          message: failur.errorMessageModel.message,
        ),
      );
    }
  }
}
