import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_or_update_address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';

import '../../../core/error/failure.dart';

class DeleteAddressUseCase {
  final BasePaymentRepository basePaymentRepository;
  DeleteAddressUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, AddOrDeleteOrUpdateAddress>> call({required int addressId}) async {
    return await basePaymentRepository.deleteAddress(addressId: addressId);
  }
}
