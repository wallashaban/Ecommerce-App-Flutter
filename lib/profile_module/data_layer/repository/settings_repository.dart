import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/profile_module/data_layer/data_source/settings_remote_data_source.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/change_password.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/logout.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/settings.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/notification.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/faqs.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/complaints.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';

class SettingsRepository implements BaseSettingsRepository {
  final BaseSettingsRemoteDataSource baseSettingsRemoteDataSource;

  SettingsRepository({required this.baseSettingsRemoteDataSource});
  @override
  Future<Either<Failure, ChangePassword>> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      final result = await baseSettingsRemoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }
  }

  @override
  Future<Either<Failure, Authentication>> getProfile() async {
    try {
      final result = await baseSettingsRemoteDataSource.getProfile();
      return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }
  }

  @override
  Future<Either<Failure, LogOut>> logout(
      {required String token}) async {
    try {
      final result = await baseSettingsRemoteDataSource.logout(
        token: token,
      );
      return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }
  }

  @override
  Future<Either<Failure, Authentication>> updateProfile(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String image}) async {
    try {
      final result = await baseSettingsRemoteDataSource.updateProfile(
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
    }
  }

  @override
  Future<Either<Failure, Complaints>> addComplaint({
    required String name,
    required String phone,
    required String email,
    required String message,
  }) async {
    try {
      final result = await baseSettingsRemoteDataSource.addComplaint(
        email: email,
        message: message,
        name: name,
        phone: phone,
      );
      return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    }
  }

  @override
  Future<Either<Failure, List<Faqs>>> getFaqs()async {
     try{
    final result = await baseSettingsRemoteDataSource.getFaqs();
return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    } 
  }

  @override
  Future<Either<Failure, List<Notification>>> getNotifications()async {
     try{
    final result = await baseSettingsRemoteDataSource.getNotification();
return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    } 
  }

  @override
  Future<Either<Failure, Settings>> getSettings()async {
 try{
    final result = await baseSettingsRemoteDataSource.getSettings();
return right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.message),
      );
    } 
  }
}
