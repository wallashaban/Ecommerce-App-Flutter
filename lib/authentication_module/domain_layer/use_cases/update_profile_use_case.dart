import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/repository/base_authentication_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/authentication.dart';

class UpdateProfileUseCase {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  UpdateProfileUseCase(this.baseAuthenticationRepository);

   Future<Either<Failure, Authentication>> execute({
    required String name,
    required String email,
    required String phone,
    required String image,
    required String password,
  }) async {
    return await baseAuthenticationRepository.updateProfile(
      email: email,
      image: image,
      name: name,
      phone: phone,
      password: password,
    );
  }
}
