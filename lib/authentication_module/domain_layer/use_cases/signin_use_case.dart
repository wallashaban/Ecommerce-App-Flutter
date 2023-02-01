import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/repository/base_authentication_repo.dart';

import '../../../core/error/failure.dart';

class SignInUseCase {
  final BaseAuthenticationRepository baseAuthenticationRepository;
  SignInUseCase({
    required this.baseAuthenticationRepository,
  });

   Future<Either<Failure, Authentication>> execute({
    required String email,
    required String password,
  }) async {
    return await baseAuthenticationRepository.signInUser(
      email: email,
      password: password,
    );
  }

  
}
