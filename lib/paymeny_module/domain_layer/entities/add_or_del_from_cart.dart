import 'package:equatable/equatable.dart';

class AddOrDeleteFromCart extends Equatable {
 final bool status;
 final String message;
 const AddOrDeleteFromCart({
    required this.status,
    required this.message,
  });
  
  @override
  List<Object?> get props => [
    status,
    message
  ];
}
