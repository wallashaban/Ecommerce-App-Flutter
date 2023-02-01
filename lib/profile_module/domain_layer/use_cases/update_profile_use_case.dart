import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';

import '../../../authentication_module/domain_layer/entities/authentication.dart';
import '../../../core/error/failure.dart';

class UpdateProfileUseCase {
  final BaseSettingsRepository baseSettingsRepository;

  UpdateProfileUseCase(this.baseSettingsRepository);

  Future<Either<Failure, Authentication>> call({
    required String name,
    required String email,
    required String phone,
    required String image,
    required String password,
  }) async {
   return  await baseSettingsRepository.updateProfile(
      email: email,
      password: password,
      name: name,
      phone: phone,
      image: image,
    );
  }
}
