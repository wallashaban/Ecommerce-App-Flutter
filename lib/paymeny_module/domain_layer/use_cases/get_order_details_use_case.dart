import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order_details.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';
import '../../../core/error/failure.dart';
class GetOrderDetailsUseCase {
  final BasePaymentRepository basePaymentRepository;
  GetOrderDetailsUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, GetOrderDetails>> call({required int orderId}) async {
    return await basePaymentRepository.getOrderDetails(orderId: orderId);
  }
}
