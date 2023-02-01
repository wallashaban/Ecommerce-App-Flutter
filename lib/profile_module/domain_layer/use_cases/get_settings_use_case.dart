import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/settings.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';

import '../../../core/error/failure.dart';

class GetSettingsUseCase {
  final BaseSettingsRepository baseSettingsRepository;

  GetSettingsUseCase(this.baseSettingsRepository);

  Future<Either<Failure, Settings>> call() async {
    return await baseSettingsRepository.getSettings();
  }
}
