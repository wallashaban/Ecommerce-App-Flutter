import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/cart.dart';

class GetCartUseCase {
  final BasePaymentRepository basePaymentRepository;
  GetCartUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, CartTotal>> call() async {
    return await basePaymentRepository.getCart();
  }
}
