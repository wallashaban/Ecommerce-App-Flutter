
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class UpdateUserSuccessState extends SettingsState {
 
}

class UpdateUserLoadingState extends SettingsState {}

class UpdateUserErorrState extends SettingsState {
  String error;
  UpdateUserErorrState({
    required this.error,
  });
}

class GetUserSuccessState extends SettingsState {
  GetUserSuccessState();
}

class GetUserLoadingState extends SettingsState {}

class GetUserErorrState extends SettingsState {
  String error;
  GetUserErorrState({
    required this.error,
  });
}

class GetSettingsSuccessState extends SettingsState {}

class GetSettingsLoadingState extends SettingsState {}

class GetSettingsErorrState extends SettingsState {
  String error;
  GetSettingsErorrState({
    required this.error,
  });
}

class ChangePasswordSuccessState extends SettingsState {}

class ChangePasswordLoadingState extends SettingsState {}

class ChangePasswordErorrState extends SettingsState {
  String error;
  ChangePasswordErorrState({
    required this.error,
  });
}

class AddComplaintLoadingState extends SettingsState {}

class AddComplaintSuccessState extends SettingsState {}

class AddComplaintErrorState extends SettingsState {
  String error;
  AddComplaintErrorState({
    required this.error,
  });
}

class GetNotificationsLoadingState extends SettingsState {}

class GetNotificationsSuccessState extends SettingsState {}

class GetNotificationsErrorState extends SettingsState {
  String error;
  GetNotificationsErrorState({
    required this.error,
  });
}

class GetFaqsLoadingState extends SettingsState {}

class GetFaqsSuccessState extends SettingsState {}

class GetFaqsErrorState extends SettingsState {
  String error;
  GetFaqsErrorState({
    required this.error,
  });
}

class LogOutLoadingState extends SettingsState {}

class LogOutSuccessState extends SettingsState {}

class LogOutErrorState extends SettingsState {
  String error;
  LogOutErrorState({
    required this.error,
  });
}