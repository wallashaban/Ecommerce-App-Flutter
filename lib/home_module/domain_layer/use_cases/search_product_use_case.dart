import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';
import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';

class SearchProductUseCase {
  final BaseHomeRepository baseHomeRepository;
  SearchProductUseCase(
    this.baseHomeRepository,
  );

  Future<Either<dynamic,List<Products>>> call({required String text}) async {
    return await baseHomeRepository.searchProduct(text: text);
  }
}
