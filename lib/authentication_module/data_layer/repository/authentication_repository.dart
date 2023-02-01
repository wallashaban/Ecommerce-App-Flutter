import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication_module/data_layer/data_source/authentication_remote_data_source.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/repository/base_authentication_repo.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failure.dart';

class AuthenticationRepository implements BaseAuthenticationRepository {
  final BaseAuthenticationRemoteDataSource baseAuthenticationRemoteDataSource;

  AuthenticationRepository({required this.baseAuthenticationRemoteDataSource});
  @override
  Future<Either<Failure, Authentication>> signInUser(
      {required String email, required String password}) async {
    try {
      final result = await baseAuthenticationRemoteDataSource
          .signInUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }
  }

  @override
   Future<Either<Failure, Authentication>> signUpUser(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
        try{
    final result = await baseAuthenticationRemoteDataSource.signUpUser(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }  }

  @override
  Future<Either<Failure, Authentication>> changePassword(
      {required String currentPassword, required String newPassword}) async {
        try{
    final result = await baseAuthenticationRemoteDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }  }

  @override
   Future<Either<Failure, Authentication>> getProfile() async {
    try{
    final result = await baseAuthenticationRemoteDataSource.getProfile();
return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }  }

  @override
   Future<Either<Failure, Authentication>> logout({required String token}) async {
    try{
    final result = await baseAuthenticationRemoteDataSource.logout(
      token: token,
    );
return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }  }

  @override
  Future<Either<Failure, Authentication>> updateProfile(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String image}) async {
        try{
    final result = await baseAuthenticationRemoteDataSource.updateProfile(
      email: email,
      password: password,
      name: name,
      phone: phone,
      image: image,
    );
return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }  }
}
