import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/update_cart.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';

import '../../../core/error/failure.dart';

class UpdateCartUseCase {
  final BasePaymentRepository basePaymentRepository;
  UpdateCartUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, UpdateCart>> call({required int cartId,required int quantity}) async {
    return await basePaymentRepository.updateCart(cartId: cartId,quantity: quantity);
  }
}
