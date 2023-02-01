import 'package:equatable/equatable.dart';


class AddOrDeleteFavourite extends Equatable {
  final bool status;
  final String message;
  
 const AddOrDeleteFavourite({
    required this.status,
    required this.message,
  });
  
  @override
  List<Object?> get props => [
    status,
    message,
  ];
}
