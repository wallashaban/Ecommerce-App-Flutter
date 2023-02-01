import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/repository/base_authentication_repo.dart';

import '../../../core/error/failure.dart';

class SignUpUseCase {
  final BaseAuthenticationRepository baseAuthenticationRepository;
  SignUpUseCase({
    required this.baseAuthenticationRepository,
  });

  Future<Either<Failure, Authentication>> execute({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    return await baseAuthenticationRepository.signUpUser(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
  }
}
