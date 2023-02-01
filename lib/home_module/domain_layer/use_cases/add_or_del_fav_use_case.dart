import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/add_or_del_favourite.dart';
import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';

import '../../../core/error/failure.dart';

class AddOrDeleteFavouriteUseCase {
  final BaseHomeRepository baseHomeRepository;
  AddOrDeleteFavouriteUseCase(
    this.baseHomeRepository,
  );

Future<Either<Failure,AddOrDeleteFavourite>> call({required int productId}) async {
    return await baseHomeRepository.addOrDeleteFavourite(productId: productId);
  }
}
