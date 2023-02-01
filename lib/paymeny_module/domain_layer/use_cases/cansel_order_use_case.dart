import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';
import '../../../core/error/failure.dart';
class CanselOrderUseCase {
  final BasePaymentRepository basePaymentRepository;
  CanselOrderUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, AddOrder>> call({required int orderId}) async {
    return await basePaymentRepository.canselOrder(orderId: orderId);
  }
}
