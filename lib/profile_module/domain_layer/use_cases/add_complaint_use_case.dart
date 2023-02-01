import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/complaints.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';

import '../../../core/error/failure.dart';

class AddComplaintUseCase {
  final BaseSettingsRepository baseSettingsRepository;

  AddComplaintUseCase(this.baseSettingsRepository);

  Future<Either<Failure, Complaints>> call({
    required String name,
    required String phone,
    required String email,
    required String message,
  }) async {
    return await baseSettingsRepository.addComplaint(
      email: email,
      message: message,
      name: name,
      phone: phone,
    );
  }
}
