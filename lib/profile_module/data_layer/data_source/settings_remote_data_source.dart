// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:e_commerce_app/authentication_module/data_layer/models/authentication_model.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/network/error_message_model.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/change_password_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/complaints_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/faqs_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/logout_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/notifications_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/settings_model.dart';

import '../../../core/utils/shared_preferences.dart';


abstract class BaseSettingsRemoteDataSource {

  Future<LogOutModel> logout({
    required String token,
  });

  Future<AuthenticationModel> getProfile();

  Future<AuthenticationModel> updateProfile({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String image,
  });

  Future<ChangePasswordModel> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<ComplaintModel> addComplaint({
    required String name,
    required String phone,
    required String email,
    required String message,
  });

  Future<List<FaqModel>> getFaqs();
  Future<List<NotificationsModel>> getNotification();
  Future<SettingsModel> getSettings();
}

class SettingsRemoteDataSource
    implements BaseSettingsRemoteDataSource {
  Dio? dio;
  SettingsRemoteDataSource() {
   BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'lang': SharedPreference.getData(key: 'language'),
          'Authorization':SharedPreference.getData(key: 'token',),
          'Content-Type': 'application/json',
        });
    dio = Dio(options);
  }



  @override
  Future<ChangePasswordModel> changePassword(
      {required String currentPassword, required String newPassword}) async {
    Response response = await dio!.post(AppConstants.changePass,
    queryParameters: {
      'current_password':currentPassword,
      'new_password':newPassword,
    });
    // debugPrint('change pass ${response.data.toString()}');
    if (response.data['status']) {
      return ChangePasswordModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AuthenticationModel> getProfile() async {
    Response response = await dio!.get(AppConstants.profile);
     //debugPrint('get profile data ${response.data.toString()}');
    if (response.data['status']) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<LogOutModel> logout({required String token}) async {
    Response response = await dio!.post(AppConstants.logOut);
      //debugPrint('Logout data ${response.data.toString()}');
    if (response.data['status']) {
      return LogOutModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AuthenticationModel> updateProfile(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String image}) async {
    final Response response = await dio!.put(AppConstants.updateProfile);
     //debugPrint('Update profile data ${response.data.toString()}');
    if (response.data['status']) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ComplaintModel> addComplaint({
    required String name,
    required String phone,
    required String email,
    required String message,
  }) async {
   Response response = await dio!.post(AppConstants.complaints,
   queryParameters: {
    'name':name,
    'phone':phone,
    'email':email,
    'message':message,
   });
   // debugPrint('Complaint ${response.data}');
    if (response.data['status']) {
      return ComplaintModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<FaqModel>> getFaqs() async {
    Response response = await dio!.get(AppConstants.faqs);
    //debugPrint('faq ${response.data}');
    if (response.data['status']) {
      return List<FaqModel>.from(response.data['data']['data'].map((faq)=>FaqModel.fromJson(faq))).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<NotificationsModel>> getNotification() async {
   Response response = await dio!.get(AppConstants.notifications);
   // debugPrint('notifications ${response.data}');
    if (response.data['status']) {
      return List<NotificationsModel>.from(response.data['data']['data'].map((faq)=>NotificationsModel.fromJson(faq))).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SettingsModel> getSettings() async {
   Response response = await dio!.get(AppConstants.settings);
    //debugPrint('Settings ${response.data}');
    if (response.data['status']) {
      return SettingsModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
