import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';

class GetProfileUseCase {
  final BaseSettingsRepository baseSettingsRepository;

  GetProfileUseCase(this.baseSettingsRepository);

   Future<Either<Failure, Authentication>> execute() async {
    return await baseSettingsRepository.getProfile();
  }
}
