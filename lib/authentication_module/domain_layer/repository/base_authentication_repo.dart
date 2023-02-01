import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';

import '../../../core/error/failure.dart';

abstract class BaseAuthenticationRepository {
  Future<Either<Failure, Authentication>>signInUser({
    required String email,
    required String password,
  });
   Future<Either<Failure, Authentication>> signUpUser({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

   Future<Either<Failure, Authentication>> logout({
    required String token,
  });

   Future<Either<Failure, Authentication>> getProfile();

  Future<Either<Failure, Authentication>> updateProfile({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String image,
  });

   Future<Either<Failure, Authentication>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

}
