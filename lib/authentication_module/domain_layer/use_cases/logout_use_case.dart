import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/logout.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';

import '../../../core/error/failure.dart';

class LogOutUseCase {
  final BaseSettingsRepository baseSettingsRepository;

  LogOutUseCase(this.baseSettingsRepository);

   Future<Either<Failure, LogOut>> execute(
    {
      required String token,
    }
  ) async {
    return await baseSettingsRepository.logout(
     token: token,
    );
  }
}
