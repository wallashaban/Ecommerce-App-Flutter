import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/change_password.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/complaints.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/faqs.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/logout.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/notification.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/settings.dart';

import '../../../authentication_module/domain_layer/entities/authentication.dart';
import '../../../core/error/failure.dart';

abstract class BaseSettingsRepository {
    Future<Either<Failure, LogOut>> logout({
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

   Future<Either<Failure, ChangePassword>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, Settings>> getSettings();
  Future<Either<Failure, List<Notification>>> getNotifications();
  Future<Either<Failure, List<Faqs>>> getFaqs();

  Future<Either<Failure, Complaints>> addComplaint({
    required String name,
    required String phone,
    required String email,
    required String message,
  });
}
