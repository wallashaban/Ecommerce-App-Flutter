import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/notification.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';

import '../../../core/error/failure.dart';

class GetNotificationssUseCase {
  final BaseSettingsRepository baseSettingsRepository;

  GetNotificationssUseCase(this.baseSettingsRepository);

  Future<Either<Failure, List<Notification>>> call() async {
    return await baseSettingsRepository.getNotifications();
  }
}
