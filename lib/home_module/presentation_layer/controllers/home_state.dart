part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetDataSuccessState extends HomeState {
}

class GetDataLoadingState extends HomeState {}

class GetDataErorrState extends HomeState {
  final String error;
  const GetDataErorrState({
    required this.error,
  });
}

class GetCategorySuccessState extends HomeState {
}

class GetCategoryLoadingState extends HomeState {}

class GetCategoryErorrState extends HomeState {
  final String error;
  const GetCategoryErorrState({
    required this.error,
  });
}

class ChangeNavbarSuccessState extends HomeState {}

class Done extends HomeState{}

class GetFavouriteLoadingState extends HomeState {}

class GetFavouriteErorrState extends HomeState {
  final String error;
  const GetFavouriteErorrState({
    required this.error,
  });
}

//cart



class ChangeFavouriteIconColorSuccessState extends HomeState {}
//cart
class ChangeCartIconColorSuccessState extends HomeState {}

class GetFavouriteSuccessState extends HomeState {}

class AddOrDeleteFavouriteLoadingState extends HomeState {}

class AddOrDeleteFavouriteErorrState extends HomeState {
  final String error;
  const AddOrDeleteFavouriteErorrState({
    required this.error,
  });
}

class AddOrDeleteFavouriteSuccessState extends HomeState {}
///cart
class AddOrDeleteCartLoadingState extends HomeState {}

class AddOrDeleteCartErorrState extends HomeState {
  final String error;
  const AddOrDeleteCartErorrState({
    required this.error,
  });
}

class AddOrDeleteCartSuccessState extends HomeState {}

class GetProductDetailsSearchSccessState extends HomeState {}

class GetProductDetailsSearchErrorState extends HomeState {
  final String error;
  const GetProductDetailsSearchErrorState({
    required this.error,
  });
}

class GetProductDetailsSearchLoadingState extends HomeState {}


class GetProductDetailsSuccessState extends HomeState {}

class GetProductDetailsLoadingState extends HomeState {}

class GetProductDetailsErorrState extends HomeState {
  final String error;
  const GetProductDetailsErorrState({
    required this.error,
  });
}

class GetCategoryDetailsSuccessState extends HomeState {}

class GetCategoryDetailsLoadingState extends HomeState {}

class GetCategoryDetailsErorrState extends HomeState {
  final String error;
  const GetCategoryDetailsErorrState({
    required this.error,
  });
}
