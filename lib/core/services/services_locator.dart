import 'package:e_commerce_app/authentication_module/data_layer/data_source/authentication_remote_data_source.dart';
import 'package:e_commerce_app/authentication_module/data_layer/repository/authentication_repository.dart';
import 'package:e_commerce_app/authentication_module/domain_layer/repository/base_authentication_repo.dart';
import 'package:e_commerce_app/home_module/data_layer/data_source/home_remote_data_source.dart';
import 'package:e_commerce_app/home_module/data_layer/repository/home_repository.dart';
import 'package:e_commerce_app/home_module/domain_layer/repository/base_home_repository.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/add_or_del_fav_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_categories_details_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_favourite_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_home_data_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_product_details_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/search_product_use_case.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/data_source/payment_remote_data_source.dart';
import 'package:e_commerce_app/paymeny_module/data_layer/repository/payment_repository.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/add_address_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/add_or_del_cart_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/add_order_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/cansel_order_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/delete_address_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/get_address_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/get_order_details_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/get_order_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/update_address_use_case.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/use_cases/update_cart_use_case.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:e_commerce_app/profile_module/data_layer/data_source/settings_remote_data_source.dart';
import 'package:e_commerce_app/profile_module/data_layer/repository/settings_repository.dart';
import 'package:e_commerce_app/profile_module/domain_layer/repository/base_settings_repo.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/add_complaint_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/change_password_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/get_faqs_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/get_notifications_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/get_profile_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/get_settings_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/logout_use_case.dart';
import 'package:e_commerce_app/profile_module/domain_layer/use_cases/update_profile_use_case.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../authentication_module/domain_layer/use_cases/sign_up_use_case.dart';
import '../../authentication_module/domain_layer/use_cases/signin_use_case.dart';
import '../../home_module/presentation_layer/controllers/home_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Authentication remoteDataSource
    sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource(),
    );

    /// Authentication Repository
    sl.registerLazySingleton<BaseAuthenticationRepository>(
      () => AuthenticationRepository(baseAuthenticationRemoteDataSource: sl()),
    );

    /// Authentication UseCase
    sl.registerLazySingleton(
      () => SignInUseCase(baseAuthenticationRepository: sl()),
    );

    /// Authentication signUp UseCase
    sl.registerLazySingleton(
      () => SignUpUseCase(baseAuthenticationRepository: sl()),
    );

    /// Home cubit
    sl.registerFactory(
      () => HomeCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(),sl()),
    );
        /// Payment cubit
    sl.registerFactory(
      () => PaymentCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(),sl(),sl(),sl(),sl()),
    );

   /// settings cubit
    sl.registerFactory(
      () => SettingsCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(),sl(),),
    );
    /// Home remoteDataSource
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
      () => HomeRemoteDataSource(),
    );

    /// Home Repository
    sl.registerLazySingleton<BaseHomeRepository>(
      () => HomeRepository(sl()),
    );

    /// Home Get HomeData
    sl.registerLazySingleton(
      () => GetHomeDataUseCase(sl()),
    );

    /// Home Get Categories UseCase
    sl.registerLazySingleton(
      () => GetCategoriesUseCase(sl()),
    );

    /// Home Get favourites UseCase
    sl.registerLazySingleton(
      () => GetFavouriteUseCase(sl()),
    );

    /// Home Get ProductDetails UseCase
    sl.registerLazySingleton(
      () => GetProductDetailsUseCase(sl()),
    );

    /// Home Get search Categories UseCase
    sl.registerLazySingleton(
      () => SearchProductUseCase(sl()),
    );

    /// Home Add or delete favourite UseCase
    sl.registerLazySingleton(
      () => AddOrDeleteFavouriteUseCase(sl()),
    );

    /// Home Get Categories UseCase
    sl.registerLazySingleton(
      () => GetCategoriesDetailsUseCase(sl()),
    );

    /// Payment remoteDataSource
    sl.registerLazySingleton<BasePaymentRemoteDataSource>(
      () => PaymentRemoteDataSource(),
    );

    /// Payment Repository
    sl.registerLazySingleton<BasePaymentRepository>(
      () => PaymentRepository(sl()),
    );

    /// Payment Get Orders
    sl.registerLazySingleton(
      () => GetOrdersUseCase(sl()),
    );

    /// Payment add or delete cart UseCase
    sl.registerLazySingleton(
      () => AddOrDeleteCarttCartUseCase(sl()),
    );

    /// Payment Get cart UseCase
    sl.registerLazySingleton(
      () => GetCartUseCase(sl()),
    );

    /// Payment Get address  UseCase
    sl.registerLazySingleton(
      () => GetAddressUseCase(sl()),
    );

    /// Payment Add address UseCase
    sl.registerLazySingleton(
      () => AddAddressUseCase(sl()),
    );

    /// Payment cansel order  UseCase
    sl.registerLazySingleton(
      () => CanselOrderUseCase(sl()),
    );

    /// Payment delets address   UseCase
    sl.registerLazySingleton(
      () => DeleteAddressUseCase(sl()),
    );

    /// Payment get order details UseCase
    sl.registerLazySingleton(
      () => GetOrderDetailsUseCase(sl()),
    );

    /// Payment update cart  UseCase
    sl.registerLazySingleton(
      () => UpdateCartUseCase(sl()),
    );

    /// Payment update address   UseCase
    sl.registerLazySingleton(
      () => UpdateAddressUseCase(sl()),
    );

    /// Payment add order   UseCase
    sl.registerLazySingleton(
      () => AddOrderUseCase(sl()),
    );

    /// Settings remoteDataSource
    sl.registerLazySingleton<BaseSettingsRemoteDataSource>(
      () => SettingsRemoteDataSource(),
    );

    /// Settings Repository
    sl.registerLazySingleton<BaseSettingsRepository>(
      () => SettingsRepository(baseSettingsRemoteDataSource: sl()),
    );

    /// Settings Get Profile
    sl.registerLazySingleton(
      () => GetProfileUseCase(sl()),
    );

    /// Settings updateProfile
    sl.registerLazySingleton(
      () => UpdateProfileUseCase(sl()),
    );

    /// Settings Get Settings
    sl.registerLazySingleton(
      () => GetSettingsUseCase(sl()),
    );

    /// Payment Get Faqs  UseCase
    sl.registerLazySingleton(
      () => GetFaqsUseCase(sl()),
    );

    /// Settings Get Notifications UseCase
    sl.registerLazySingleton(
      () => GetNotificationssUseCase(sl()),
    );

    /// Settings Add Complaints  UseCase
    sl.registerLazySingleton(
      () => AddComplaintUseCase(sl()),
    );

    /// Settings Logout   UseCase
    sl.registerLazySingleton(
      () => LogOutUseCase(sl()),
    );

    /// Settings change password   UseCase
    sl.registerLazySingleton(
      () => ChangePasswordUseCase(sl()),
    );
  }
}
