import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/authentication_module/data_layer/models/authentication_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/change_password_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/complaints_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/logout_model.dart';
import 'package:e_commerce_app/profile_module/data_layer/models/settings_model.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/change_password.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/complaints.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/faqs.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/logout.dart';
import 'package:e_commerce_app/profile_module/domain_layer/entities/notification.dart'
    as not;
import 'package:e_commerce_app/profile_module/domain_layer/entities/settings.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/add_complaint_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/change_password_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/get_faqs_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/get_notifications_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/get_profile_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/get_settings_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/logout_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/update_profile_use_case.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_states.dart';
import 'package:flutter/cupertino.dart';
import '../../../authentication_module/domain_layer/entities/authentication.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/error_message_model.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final LogOutUseCase logOutUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final GetFaqsUseCase getFaqsUseCase;
  final GetSettingsUseCase getSettingsUseCase;
  final GetNotificationssUseCase getNotificationssUseCase;
  final AddComplaintUseCase addComplaintUseCase;

  SettingsCubit(
    this.getProfileUseCase,
    this.updateProfileUseCase,
    this.logOutUseCase,
    this.changePasswordUseCase,
    this.getFaqsUseCase,
    this.getSettingsUseCase,
    this.getNotificationssUseCase,
    this.addComplaintUseCase,
  ) : super(SettingsInitial());
  Authentication getProfileModel = const AuthenticationModel();
  Authentication updateProfileModel = const AuthenticationModel();

  List<Faqs> faqModel = [];
  List<not.Notification> notifications = [];
  Settings settings = const SettingsModel(
    about:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry'
        ' . Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
        ' when an unknown printer took a galley of type and scrambled it to make a type'
        ' specimen book. It has survived not only five centuries, but also the leap into'
        ' electronic typesetting, remaining essentially unchanged. It was popularised in the'
        '1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
        'recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    terms: 'terms',
  );

  Complaints complaints = const ComplaintModel();
  ChangePassword changePasswordModel = const ChangePasswordModel(
    status: false,
    message: 'message',
  );
  LogOut logOut = const LogOutModel(
    id: 1,
    token: 'token',
    status: false,
    message: 'message',
  );
  ErrorMessageModel errorMessageModel =
      const ErrorMessageModel(status: false, message: 'message');
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
 /*  getLang(){
   return SharedPreference.getData(key: 'language');
  } */
  //  bool isTabbedAr = SharedPreference.getData(key: 'language');

  getProfile() async {
    emit(GetUserLoadingState());
    getProfileUseCase.execute().then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error add order  ${serverFailure.message}');
          emit(
            GetUserErorrState(error: l.message),
          );
        },
        (r) {
          getProfileModel = r;
          debugPrint('get Profile ${getProfileModel.message}');
          emit(
            GetUserSuccessState(),
          );
        },
      );
    });
  }

  updateProfile({
    required String name,
    required String phone,
    required String email,
    required String image,
    required String password,
  }) async {
    emit(UpdateUserLoadingState());
    updateProfileUseCase
        .call(
      email: email,
      image: image,
      name: name,
      password: password,
      phone: phone,
    )
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error update user  ${serverFailure.message}');
          emit(
            UpdateUserErorrState(error: l.message),
          );
        },
        (r) {
          updateProfileModel = r;
          debugPrint('update Profile ${updateProfileModel.message}');
          emit(
            UpdateUserSuccessState(),
          );
        },
      );
    });
  }

  logoutUser({
    required String token,
  }) async {
    emit(LogOutLoadingState());
    logOutUseCase.execute(token: token).then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error logout   ${serverFailure.message}');
          emit(
            LogOutErrorState(error: l.message),
          );
        },
        (r) {
          logOut = r;
          debugPrint('get logout ${logOut.message}');
          emit(
            LogOutSuccessState(),
          );
        },
      );
    });
  }

  changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoadingState());
    changePasswordUseCase
        .execute(
      currentPassword: currentPassword,
      newPassword: newPassword,
    )
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error changePassword order  ${serverFailure.message}');
          emit(
            ChangePasswordErorrState(error: l.message),
          );
        },
        (r) {
          changePasswordModel = r;
          debugPrint('get cahnge password ${changePasswordModel.message}');
          emit(
            ChangePasswordSuccessState(),
          );
        },
      );
    });
  }

  getFaqs() async {
    emit(GetFaqsLoadingState());
    getFaqsUseCase.call().then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error get faqs order  ${serverFailure.message}');
          emit(
            GetFaqsErrorState(error: l.message),
          );
        },
        (r) {
          faqModel = r;
          debugPrint('get faqs ${faqModel[0].question}');
          emit(
            GetFaqsSuccessState(),
          );
        },
      );
    });
  }

  getSettings() async {
    emit(GetSettingsLoadingState());
    getSettingsUseCase.call().then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error get settings   ${serverFailure.message}');
          emit(
            GetSettingsErorrState(error: l.message),
          );
        },
        (r) {
          settings = r;
          debugPrint('get settings ${settings.about}');
          emit(
            GetSettingsSuccessState(),
          );
        },
      );
    });
  }

  getNotifications() async {
    emit(GetNotificationsLoadingState());
    getNotificationssUseCase.call().then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error notifications  ${serverFailure.message}');
          emit(
            GetNotificationsErrorState(error: l.message),
          );
        },
        (r) {
          notifications = r;
          debugPrint('get notifications ${notifications[0].message}');
          emit(
            GetNotificationsSuccessState(),
          );
        },
      );
    });
  }

  addComplaint({
    required String name,
    required String phone,
    required String email,
    required String message,
  }) async {
    emit(AddComplaintLoadingState());
    addComplaintUseCase
        .call(
      email: email,
      message: message,
      name: name,
      phone: phone,
    )
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error add complaint  ${serverFailure.message}');
          emit(
            AddComplaintErrorState(error: l.message),
          );
        },
        (r) {
          complaints = r;
          debugPrint('get complaint ${complaints.message}');
          emit(
            AddComplaintSuccessState(),
          );
        },
      );
    });
  }
}
