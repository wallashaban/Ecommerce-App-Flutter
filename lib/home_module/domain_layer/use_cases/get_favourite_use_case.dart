import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/favourites.dart';
import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';

import '../../../core/error/failure.dart';

class GetFavouriteUseCase {
  final BaseHomeRepository baseHomeRepository;
  GetFavouriteUseCase(
    this.baseHomeRepository,
  );

  Future<Either<Failure,List<Favourites>>> call() async {
    return await baseHomeRepository.getFavourites();
  }
}
