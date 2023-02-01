// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/network/error_message_model.dart';
import 'package:e_commerce_app/core/services/services_locator.dart';
import 'package:e_commerce_app/home_module/data_layer/models/add_or_del_favourite_model.dart';
import 'package:e_commerce_app/home_module/data_layer/models/home_model.dart';
import 'package:e_commerce_app/home_module/data_layer/models/products_model.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/add_or_del_favourite.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/categories.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/favourites.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/add_or_del_fav_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_categories_details_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_favourite_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_home_data_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/get_product_details_use_case.dart';
import 'package:e_commerce_app/home_module/domain_layer/use_cases/search_product_use_case.dart';
import 'package:e_commerce_app/home_module/presentation_layer/screens/home_screen.dart';
import 'package:e_commerce_app/home_module/presentation_layer/screens/favourite_screen.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/screens/cart_screen.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/settings_screen.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../paymeny_module/data_layer/models/add_or_del_from_cart_model.dart';
import '../../../paymeny_module/domain_layer/entities/add_or_del_from_cart.dart';
import '../../../paymeny_module/domain_layer/use_cases/add_or_del_cart_use_case.dart';
import '../../domain_layer/entities/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;

  final GetCategoriesUseCase getCategoriesUseCase;
  final GetCategoriesDetailsUseCase getCategoriesDetailsUseCase;
  final GetFavouriteUseCase getFavouriteUseCase;
  final AddOrDeleteFavouriteUseCase addOrDeleteFavouriteUseCase;
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final SearchProductUseCase searchProductUseCase;
  final AddOrDeleteCarttCartUseCase addOrDeleteCarttCartUseCase;
  HomeCubit(
    this.getHomeDataUseCase,
    this.getCategoriesUseCase,
    this.getCategoriesDetailsUseCase,
    this.getFavouriteUseCase,
    this.addOrDeleteFavouriteUseCase,
    this.getProductDetailsUseCase,
    this.searchProductUseCase,
    this.addOrDeleteCarttCartUseCase,
  ) : super(
          HomeInitial(),
        );

  List<Widget> screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const CartScreen(),
    const SettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Favourite',
    'Cart',
    'Settings',
  ];

  int index = 0;

  changeBottomNavigationbar(int index) {
    this.index = index;
    emit(
      ChangeNavbarSuccessState(),
    );
    emit(Done());
  }

  Home homeModel = HomeModel();
  Map<int, bool> inFavourites = {};
  Map<int, bool> inCarts = {};
  getHomeData() async {
    emit(GetDataLoadingState());
    await getHomeDataUseCase().then((value) {
      homeModel = value;
      homeModel.products.forEach(((product) {
        inFavourites.addAll(
          {
            product.id: product.inFavourite,
          },
        );
      }));
      homeModel.products.forEach(((product) {
        inCarts.addAll(
          {
            product.id: product.inCart,
          },
        );
      }));
      //  debugPrint('Home incart ${inCarts}');
      debugPrint('Home data ${homeModel.products[0].id}');
      emit(
        GetDataSuccessState(),
      );
    });
  }

  List<Categories> categoriesModel = [];
  getCategories() async {
    emit(GetCategoryDetailsLoadingState());

    getCategoriesUseCase.call().then((value) {
      categoriesModel = value;
      debugPrint('Categories data ${categoriesModel[0].name}');
      emit(
        GetCategorySuccessState(),
      );
    }).catchError((error) {
      emit(
        GetCategoryErorrState(error: error.toString()),
      );
    });
  }

  List<Favourites> favourites = [];
  ErrorMessageModel errorMessageModel =
      const ErrorMessageModel(status: false, message: 'message');
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  getFavourites() async {
    emit(GetFavouriteLoadingState());
    getFavouriteUseCase.call().then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error fav ${serverFailure.message}');
          emit(
            GetFavouriteErorrState(error: l.message),
          );
        },
        (r) {
          favourites = r;
          //debugPrint('get fav ${favourites[0].favProduct.name}');
          emit(
            GetFavouriteSuccessState(),
          );
        },
      );
    });
  }

  List<Products> categoryDetails = [];
  getCategoriesDetails({required int categoryId}) async {
    // print('object');
    emit(GetCategoryDetailsLoadingState());
    await getCategoriesDetailsUseCase
        .call(categoryId: categoryId)
        .then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error fav ${serverFailure.message}');
          emit(
            GetCategoryDetailsErorrState(error: l.message),
          );
        },
        (r) {
          categoryDetails = r;
          r.forEach(
            (element) {
              inFavourites.addAll({
                element.id: element.inFavourite,
              });
              inCarts.addAll({
                element.id: element.inCart,
              });
            },
          );

          debugPrint('get category details ${categoryDetails[0].name}');
          emit(
            GetCategoryDetailsSuccessState(),
          );
        },
      );
    });
  }

  // ignore: todo
  List<Products> searchProduct = []; //TODO
  searchProducts({required String productName}) async {
    emit(GetProductDetailsSearchLoadingState());
    searchProductUseCase.call(text: productName).then((value) {
      // debugPrint('search ${value.toString()}');
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error search product ${serverFailure.message}');
          emit(
            GetProductDetailsSearchErrorState(error: l.message),
          );
        },
        (r) {
          searchProduct = r;
          //debugPrint('get searchProduct  ${searchProduct}');
          emit(
            GetProductDetailsSearchSccessState(),
          );
        },
      );
    });
  }

  Products productDetails = const ProductsModel();

  getProductDetails({required int productId}) async {
    emit(GetProductDetailsLoadingState());
    getProductDetailsUseCase(productId: productId).then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error product Details${serverFailure.message}');
          emit(
            GetProductDetailsErorrState(error: l.message),
          );
        },
        (r) {
          productDetails = r;
          debugPrint('product details${productDetails.name}');

          emit(
            GetProductDetailsSuccessState(),
          );
        },
      );
    });
  }

  AddOrDeleteFavourite addOrDeleteFavourite = const AddOrDeleteFavouriteModel();

  addOrDeleteFavourites({required int productId}) async {
    emit(AddOrDeleteFavouriteLoadingState());
    inFavourites[productId] = !inFavourites[productId]!; //todo
    debugPrint('add or del fav${inFavourites[productId]}');
    emit(
      ChangeFavouriteIconColorSuccessState(),
    );

    addOrDeleteFavouriteUseCase(productId: productId).then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error add or del fav${serverFailure.message}');
          emit(
            AddOrDeleteFavouriteErorrState(error: l.message),
          );
        },
        (r) {
          addOrDeleteFavourite = r;
          debugPrint('add or del fav${addOrDeleteFavourite.message}');
          getFavourites();
          emit(
            AddOrDeleteFavouriteSuccessState(),
          );
        },
      );
    });
  }

  //cart

  AddOrDeleteFromCart addOrDeleteFromCartModel =
      const AddOrDeleteFromCartModel(message: '', status: false);
  addOrDeleteFromCart({required int productId}) async {
    emit(AddOrDeleteCartLoadingState());
    inCarts[productId] = !inCarts[productId]!;
    emit(
      ChangeCartIconColorSuccessState(),
    );
    addOrDeleteCarttCartUseCase.call(productId: productId).then((value) {
      value.fold(
        (l) {
          serverFailure = l;
          debugPrint('error add or delete cart  ${serverFailure.message}');
          emit(
            AddOrDeleteCartErorrState(error: l.message),
          );
        },
        (r) {
          addOrDeleteFromCartModel = r;
          debugPrint(
              ' add or delete cart  ${addOrDeleteFromCartModel.message}');
          //if (getCart.cart.length != 1) //todo get cart
          {}
          sl<PaymentCubit>().getCarts();
          emit(AddOrDeleteCartSuccessState());
        },
      );
    });
  }
}
