import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';
import '../../../core/error/failure.dart';

class GetAddressUseCase {
  final BasePaymentRepository basePaymentRepository;
  GetAddressUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, List<Address>>> call() async {
    return await basePaymentRepository.getAddress();
  }
}
