import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';

import '../../../core/error/failure.dart';

class GetCategoriesDetailsUseCase {
  final BaseHomeRepository baseHomeRepository;
  GetCategoriesDetailsUseCase(
    this.baseHomeRepository,
  );

  Future<Either<Failure,List<Products>> >call({required int categoryId}) async {
    return await baseHomeRepository.getCategoriesDetails(categoryId: categoryId);
  }

}
