import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/change_password.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';
import '../../../core/error/failure.dart';
class ChangePasswordUseCase {
  final BaseSettingsRepository baseSettingsRepository;

  ChangePasswordUseCase(this.baseSettingsRepository);

   Future<Either<Failure, ChangePassword>> execute(
    {
      required String currentPassword,
      required String newPassword,
    }
  ) async {
    return await baseSettingsRepository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
