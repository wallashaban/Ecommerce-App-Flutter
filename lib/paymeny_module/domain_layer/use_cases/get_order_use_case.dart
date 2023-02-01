import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';
import '../../../core/error/failure.dart';

class GetOrdersUseCase {
  final BasePaymentRepository basePaymentRepository;
  GetOrdersUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, List<GetOrder>>> call() async {
    return await basePaymentRepository.getOrders();
  }
}
