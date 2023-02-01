import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';

import 'package:e_commerce_app/home_module/domain_layer/entities/home.dart';

class GetHomeDataUseCase {
  final BaseHomeRepository baseHomeRepository;
  GetHomeDataUseCase(
    this.baseHomeRepository,
  );

  Future< Home> call() async {
    return await baseHomeRepository.getHomeData();
  }
}
