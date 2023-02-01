import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/repository/base_authentication_repo.dart';
import 'package:e_commerce_app/core/error/failure.dart';

class GetProfileUseCase {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  GetProfileUseCase(this.baseAuthenticationRepository);

   Future<Either<Failure, Authentication>> execute() async {
    return await baseAuthenticationRepository.getProfile();
  }
}
