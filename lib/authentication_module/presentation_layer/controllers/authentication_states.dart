
import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class ChangePasswordSuccessState extends AuthenticationState{}

class SignInSuccessState extends AuthenticationState {
  Authentication model;
  SignInSuccessState({
    required this.model,
  });
}

class SignInLoadingState extends AuthenticationState {}

class SignInErorrState extends AuthenticationState {
  String error;
  SignInErorrState({
    required this.error,
  });
}


class SignUpSuccessState extends AuthenticationState {
  Authentication model;
  SignUpSuccessState({
    required this.model,
  });
}

class SignUpLoadingState extends AuthenticationState {}

class SignUpErorrState extends AuthenticationState {
  String error;
  SignUpErorrState({
    required this.error,
  });
}

