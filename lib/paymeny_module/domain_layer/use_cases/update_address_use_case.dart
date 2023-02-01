import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/add_or_del_or_update_address.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';

import '../../../core/error/failure.dart';

class UpdateAddressUseCase {
  final BasePaymentRepository basePaymentRepository;
  UpdateAddressUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, AddOrDeleteOrUpdateAddress>> call({
    required String name,
    required String regoin,
    required String city,
    required String details,
    required String notes,
    required double longitude,
    required double latitude,
     required int addressId,
  }) async {
    return await basePaymentRepository.updateAddress(
      addressId: addressId,
      city: city,
      details: details,
      latitude: latitude,
      longitude: longitude,
      name: name,
      notes: notes,
      regoin: regoin,
    );
  }
}
