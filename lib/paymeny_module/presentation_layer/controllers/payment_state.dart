part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class ChangebasketIconColorSuccessState extends PaymentState{}
class ChangeRadioValSuccessState extends PaymentState{}


class CanselOrderLoadingState extends PaymentState {}

class CanselOrderSuccessState extends PaymentState {}

class CanselOrderErrorState extends PaymentState {
  final String error;
  const CanselOrderErrorState({
    required this.error,
  });
}

class UpdatecartLoadingState extends PaymentState {}

class UpdatecarSuccessState extends PaymentState {}

class UpdatecartErrorState extends PaymentState {
 final String error;
 const UpdatecartErrorState({
    required this.error,
  });
  
}

class AddOrDeleteCartLoadingState extends PaymentState {}

class AddOrDeleteCartSuccessState extends PaymentState {}

class AddOrDeleteCartErrorState extends PaymentState {
  final String error;
  const AddOrDeleteCartErrorState({
    required this.error,
  });
}

class PaymentInitial extends PaymentState {}

class CancelOrderSuccessState extends PaymentState {}

class GetCartLoadingState extends PaymentState {}

class GetCartSuccessState extends PaymentState {}

class GetCartErrorState extends PaymentState {
  final String error;

  const GetCartErrorState({required this.error});
}

class CancelOrderLoadingState extends PaymentState {}

class CancelOrderErorrState extends PaymentState {
  final String error;
  const CancelOrderErorrState({
    required this.error,
  });
}

class GetAddressSuccessState extends PaymentState {}

class GetAddressLoadingState extends PaymentState {}

class GetAddressErorrState extends PaymentState {
  final String error;
  const GetAddressErorrState({
    required this.error,
  });
}

class PostAddressSuccessState extends PaymentState {}

class PostAddressLoadingState extends PaymentState {}

class PostAddressErorrState extends PaymentState {
  final String error;
  const PostAddressErorrState({
    required this.error,
  });
}

class PutAddressSuccessState extends PaymentState {}

class PutAddressLoadingState extends PaymentState {}

class PutAddressErorrState extends PaymentState {
  final String error;
  const PutAddressErorrState({
    required this.error,
  });
}

class DeleteAddressSuccessState extends PaymentState {}

class DeleteAddressLoadingState extends PaymentState {}

class DeleteAddressErorrState extends PaymentState {
  final String error;
  const DeleteAddressErorrState({
    required this.error,
  });
}

class GetOrdersSuccessState extends PaymentState {}

class GetOrdersLoadingState extends PaymentState {}

class GetOrdersErorrState extends PaymentState {
  final String error;
  const GetOrdersErorrState({
    required this.error,
  });
}

class GetOrderDetailsSuccessState extends PaymentState {}

class GetOrderDetailsLoadingState extends PaymentState {}

class GetOrderDetailsErorrState extends PaymentState {
  final String error;
  const GetOrderDetailsErorrState({
    required this.error,
  });
}

class AddOrderSuccessState extends PaymentState {}

class AddOrderLoadingState extends PaymentState {}

class AddOrderErorrState extends PaymentState {
  final String error;
  const AddOrderErorrState({
    required this.error,
  });
}
