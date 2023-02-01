import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/faqs.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';

import '../../../core/error/failure.dart';

class GetFaqsUseCase {
  final BaseSettingsRepository baseSettingsRepository;

  GetFaqsUseCase(this.baseSettingsRepository);

  Future<Either<Failure, List<Faqs>>> call() async {
    return await baseSettingsRepository.getFaqs();
  }
}
