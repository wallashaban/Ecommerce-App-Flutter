import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/add_order.dart';
import '../repository/base_payment_repository.dart';

class AddOrderUseCase {
  final BasePaymentRepository basePaymentRepository;
  AddOrderUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, AddOrder>> call({
    required int orderId,
    required int paymentMethod,
  }) async {
    return await basePaymentRepository.addOrder(
      orderId: orderId,
      paymentMethod: paymentMethod,
    );
  }
}
