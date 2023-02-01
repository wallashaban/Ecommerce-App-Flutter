import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_from_cart.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_or_update_address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/cart.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order_details.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/update_cart.dart';

abstract class BasePaymentRepository {
  ///Cart Functions
  Future<Either<Failure, CartTotal>> getCart();
  Future<Either<Failure, AddOrDeleteFromCart>> addOrDelteFromCart(
      {required int productId});
  Future<Either<Failure, UpdateCart>> updateCart(
      {required int cartId, required int quantity});

  ///Address Functions
  Future<Either<Failure, List<Address>>> getAddress();
  Future<Either<Failure, AddOrDeleteOrUpdateAddress>> addAddress({
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  });
  Future<Either<Failure, AddOrDeleteOrUpdateAddress>> updateAddress({
     required int addressId,
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  });

  Future<Either<Failure, AddOrDeleteOrUpdateAddress>> deleteAddress({required int addressId});


  ///Order Functions
  Future<Either<Failure, List<GetOrder>>> getOrders();
  Future<Either<Failure, AddOrder>> addOrder({
    required int orderId,
    required int paymentMethod,
  });
  Future<Either<Failure, GetOrderDetails>> getOrderDetails({
    required int orderId,
  });
  Future<Either<Failure, AddOrder>> canselOrder({
    required int orderId,
  });

}
