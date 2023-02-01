// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/add_or_del_from_cart_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/add_or_del_or_update_address_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/add_order_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/get_order_details_model.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/models/update_cart_model.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_from_cart.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_or_update_address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/update_cart.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/add_address_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/add_or_del_cart_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/add_order_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/cansel_order_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/delete_address_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/get_address_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/get_order_details_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/get_order_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/update_address_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/update_cart_use_case.dart';

import '../../../core/error/failure.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain_layer/entities/cart.dart';
import '../../domain_layer/entities/get_order_details.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final AddAddressUseCase addAddressUseCase;
  final AddOrDeleteCarttCartUseCase addOrDeleteCarttCartUseCase;
  final CanselOrderUseCase canselOrderUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;
  final GetAddressUseCase getAddressUseCase;
  final GetCartUseCase getCartUseCase;
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateAddressUseCase updateAddressUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final AddOrderUseCase addOrderUseCase;
  PaymentCubit(
    this.addAddressUseCase,
    this.addOrDeleteCarttCartUseCase,
    this.canselOrderUseCase,
    this.deleteAddressUseCase,
    this.getAddressUseCase,
    this.getCartUseCase,
    this.getOrderDetailsUseCase,
    this.getOrdersUseCase,
    this.updateAddressUseCase,
    this.updateCartUseCase,
    this.addOrderUseCase,
  ) : super(PaymentInitial());

  GetOrderDetails getOrderDetailsModel = const GetOrderDetailsModel();
  List<OrderProducts> orderProducts = [];
  ErrorMessageModel errorMessageModel =
      const ErrorMessageModel(status: false, message: 'message');
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  getOrderDetails({
    required int orderId,
  }) async {
    emit(GetOrderDetailsLoadingState());

    getOrderDetailsUseCase.call(orderId: orderId).then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error get order details ${serverFailure.message}');
          emit(
            GetOrderDetailsErorrState(error: l.message),
          );
        },
        (r) {
          getOrderDetailsModel = r;
          orderProducts = r.orderProducts;
          debugPrint(
              ' get order details ${getOrderDetailsModel.orderProducts}');

          emit(GetOrderDetailsSuccessState());
        },
      );
    });
  }

  List<GetOrder> getOrdersModel = [];
  getOrders() async {
    emit(GetOrdersLoadingState());

    getOrdersUseCase.call().then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error get order  ${serverFailure.message}');
          emit(
            GetOrdersErorrState(error: l.message),
          );
        },
        (r) {
          getOrdersModel = r;
          debugPrint(' get order  ${getOrdersModel[0].status}');

          emit(GetOrdersSuccessState());
        },
      );
    });
  }

  CartTotal getCart = const CartTotal(subTotal: 1.0, total: 1.0, cart: []);
  getCarts() async {
    emit(GetCartLoadingState());
    getCartUseCase.call().then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error cart   ${serverFailure.message}');
          emit(
            GetCartErrorState(error: l.message),
          );
        },
        (r) {
          getCart = r;
          debugPrint(' get cart  ${getCart.cart.length}');

          emit(GetCartSuccessState());
        },
      );
    });
  }

  List<Address> getAddresses = [];
  getAddress() async {
    emit(GetAddressLoadingState());

    getAddressUseCase.call().then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error get address  ${serverFailure.message}');
          emit(
            GetAddressErorrState(error: l.message),
          );
        },
        (r) {
          getAddresses = r;
          debugPrint(' get address  ${getAddresses[0].city}');

          emit(GetAddressSuccessState());
        },
      );
    });
  }

  AddOrDeleteOrUpdateAddress addAddressModel =
      const AddOrDeleteOrUpdateAddressModel();
  addAddress({
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
  }) async {
    emit(PostAddressLoadingState());

    addAddressUseCase
        .call(
      city: city,
      details: details,
      latitude: latitude,
      longitude: longitude,
      name: name,
      notes: notes,
      regoin: regoin,
    )
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error get order  ${serverFailure.message}');
          emit(
            PostAddressErorrState(error: l.message),
          );
        },
        (r) {
          addAddressModel = r;
          debugPrint(' add address  ${addAddressModel.message}');
          getAddress();
          emit(PostAddressSuccessState());
        },
      );
    });
  }

  AddOrDeleteOrUpdateAddress updateAddressModel =
      const AddOrDeleteOrUpdateAddressModel();
  updateAddress({
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
    required int addressId,
  }) async {
    emit(PostAddressLoadingState());

    updateAddressUseCase
        .call(
      addressId: addressId,
      city: city,
      details: details,
      latitude: latitude,
      longitude: longitude,
      name: name,
      notes: notes,
      regoin: regoin,
    )
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error update address  ${serverFailure.message}');
          emit(
            PostAddressErorrState(error: l.message),
          );
        },
        (r) {
          updateAddressModel = r;
          debugPrint(' update address   ${updateAddressModel.message}');

          emit(PostAddressSuccessState());
        },
      );
    });
  }

  AddOrDeleteOrUpdateAddress deleteAddressModel =
      const AddOrDeleteOrUpdateAddressModel();
  deleteAddress({required int addressId}) async {
    emit(DeleteAddressLoadingState());

    deleteAddressUseCase.call(addressId: addressId).then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error delete address  ${serverFailure.message}');
          emit(
            DeleteAddressErorrState(error: l.message),
          );
        },
        (r) {
          deleteAddressModel = r;
          debugPrint(' delete address   ${deleteAddressModel.status}');
          getAddress();
          emit(DeleteAddressSuccessState());
        },
      );
    });
  }

  AddOrDeleteFromCart addOrDeleteFromCartModel =
      const AddOrDeleteFromCartModel(message: '', status: false);
  addOrDeleteFromCart({required int productId}) async {
    emit(AddOrDeleteCartLoadingState());
    emit(
      ChangebasketIconColorSuccessState(),
    );
    addOrDeleteCarttCartUseCase.call(productId: productId).then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error add or delete cart  ${serverFailure.message}');
          emit(
            AddOrDeleteCartErrorState(error: l.message),
          );
        },
        (r) {
          addOrDeleteFromCartModel = r;
          debugPrint(
              ' add or delete cart  ${addOrDeleteFromCartModel.message}');
          
          getCarts();
          emit(AddOrDeleteCartSuccessState());
        },
      );
    });
  }

  AddOrder canselOrderModel = const AddOrderModel();
  canselOrder({required int orderId}) async {
    emit(CanselOrderLoadingState());

    canselOrderUseCase
        .call(
      orderId: orderId,
    )
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error add order  ${serverFailure.message}');
          emit(
            CanselOrderErrorState(error: l.message),
          );
        },
        (r) {
          canselOrderModel = r;
          debugPrint(' cansel order  ${canselOrderModel.message}');
          getOrders();
          emit(CanselOrderSuccessState());
        },
      );
    });
  }

  AddOrder addOrderModel = const AddOrderModel();
  addOrder({required int orderId, required int paymentMethod}) async {
    emit(AddOrderLoadingState());

    addOrderUseCase
        .call(
      orderId: orderId,
      paymentMethod: paymentMethod,
    )
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error add order  ${serverFailure.message}');
          emit(
            AddOrderErorrState(error: l.message),
          );
        },
        (r) {
          addOrderModel = r;
          debugPrint(' add order  ${addOrderModel.message}');
          getCarts();
          emit(AddOrderSuccessState());
        },
      );
    });
  }

  int val = 1;
  changeRadioButtonValue(value) {
    val = value;
    emit(
      ChangeRadioValSuccessState(),
    );
  }

  UpdateCart updateCartModel = const UpdateCartModel();
  updateCart({required int cartId, required int quantity}) async {
    emit(UpdatecartLoadingState());

    updateCartUseCase
        .call(
      cartId: cartId,
      quantity: quantity,
    )
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error add order  ${serverFailure.message}');
          emit(
            UpdatecartErrorState(error: l.message),
          );
        },
        (r) {
          updateCartModel = r;
          debugPrint(' update cart  ${updateCartModel.message}');
          getCarts();
          emit(UpdatecarSuccessState());
        },
      );
    });
  }

  int getAddressId(int id) => id;
}
