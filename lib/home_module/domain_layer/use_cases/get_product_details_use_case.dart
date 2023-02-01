import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';
import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';

import '../../../core/error/failure.dart';

class GetProductDetailsUseCase {
  final BaseHomeRepository baseHomeRepository;
  GetProductDetailsUseCase(
    this.baseHomeRepository,
  );

  Future<Either<Failure,Products> >call({required int productId}) async {
    return await baseHomeRepository.getProductDeatils(productId: productId);
  }
}
