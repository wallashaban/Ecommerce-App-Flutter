import 'package:dio/dio.dart';
import 'package:e_commerce_app/authentication_module/data_layer/models/authentication_model.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/network/error_message_model.dart';
import 'package:e_commerce_app/core/utils/constants.dart';

import '../../../core/utils/shared_preferences.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<AuthenticationModel> signInUserWithEmailAndPassword(
      {required String email, required String password});
  Future<AuthenticationModel> signUpUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  });
  Future<AuthenticationModel> logout({
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

  Future<AuthenticationModel> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

class AuthenticationRemoteDataSource
    implements BaseAuthenticationRemoteDataSource {
  Dio? dio;
  AuthenticationRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'lang': SharedPreference.getData(key: 'language'),
        });
    dio = Dio(options);
  }

  @override
  Future<AuthenticationModel> signInUserWithEmailAndPassword(
      {required String email, required String password}) async {
    //try {
    Response response = await dio!.post(AppConstants.login, queryParameters: {
      'email': email,
      'password': password,
    });
  //  debugPrint('Login : ${response.data.toString()}');
    if (response.data['status']) {
      return AuthenticationModel.fromJson(
        response.data,
      );
    } else {
      throw ServerException(
        errorMessageModel:
            ErrorMessageModel.fromJson(response.data),
      );
    }
    /*  } catch (error) {
      debugPrint(error.toString());
      return null;
    } */
  }

  @override
  Future<AuthenticationModel> signUpUser(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    //try {
    Response response =
        await dio!.post(AppConstants.register, queryParameters: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    });
    // debugPrint('register data ${response.data.toString()}');
    if (response.data['status']) {
      return AuthenticationModel.fromJson(
        response.data,
      );
    } else {
      throw ServerException(
        errorMessageModel:
            ErrorMessageModel.fromJson(response.data),
      );
    }
    /* } catch (error) {
      debugPrint(error.toString());
    } */
  }

  @override
  Future<AuthenticationModel> changePassword(
      {required String currentPassword, required String newPassword}) async {
    Response response = await dio!.post(AppConstants.changePass);
    if (response.data['status']) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel:
            ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AuthenticationModel> getProfile() async {
    Response response = await dio!.get(AppConstants.profile);
    if (response.data['status']) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel:
            ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AuthenticationModel> logout({required String token}) async {
    Response response = await dio!.post(AppConstants.logOut);
    if (response.data['status']) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel:
            ErrorMessageModel.fromJson(response.data),
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
    if (response.data['status']) {
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel:
            ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
