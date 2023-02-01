import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';

import 'package:e_commerce_app/home_module/domain_layer/entities/categories.dart';

class GetCategoriesUseCase {
  final BaseHomeRepository baseHomeRepository;
  GetCategoriesUseCase(
    this.baseHomeRepository,
  );

  Future<List<Categories>> call() async {
    return await baseHomeRepository.getCategories();
  }

}
