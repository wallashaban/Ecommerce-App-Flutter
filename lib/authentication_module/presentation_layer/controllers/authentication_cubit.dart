import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/authentication_module/data_layer/models/authentication_model.dart';

import 'package:e_commerce_app/authentication_module/domain_layer/use_cases/sign_up_use_case.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/use_cases/signin_use_case.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/controllers/authentication_states.dart';
import 'package:e_commerce_app/core/utils/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/constants.dart';
import '../../domain_layer/entities/authentication.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  AuthenticationCubit(this.signInUseCase, this.signUpUseCase)
      : super(AuthenticationInitial());
  Authentication authenticationModel = const AuthenticationModel();
  bool isPassword = true;
  void changeIconState() {
    isPassword = !isPassword;
    emit(
      ChangePasswordSuccessState(),
    );
  }

  signInUser({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    signInUseCase
        .execute(
      email: email,
      password: password,
    )
        .then((value) {
      value.fold((l) {
        debugPrint('signIn Error ${l.message}');
        emit(
          SignInErorrState(error: l.message),
        );
      }, (r) {
        authenticationModel = r;
        token = r.token;
        debugPrint('token auth ${r.token}');
        SharedPreference.saveData(
          key: 'token',
          value: r.token,
        );
        emit(
          SignInSuccessState(model: r),
        );
      });
    });
  }

  signUpUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    signUpUseCase
        .execute(email: email, password: password, name: name, phone: phone)
        .then((value) {
      value.fold((l) {
        emit(
          SignUpErorrState(error: l.message),
        );
        debugPrint(l.message);
      }, (r) {
        authenticationModel = r;
        token = authenticationModel.token;
        emit(
          SignUpSuccessState(model: r),
        );
      });
    });
  }
}
