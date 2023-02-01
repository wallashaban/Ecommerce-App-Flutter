import 'package:equatable/equatable.dart';


class AddOrDeleteOrUpdateAddress extends Equatable {
 final bool status;
 final String message;
 //final Address address;
 const AddOrDeleteOrUpdateAddress({
    required this.status,
    required this.message,
  //  required this.address,
  });
  @override
  List<Object?> get props => [
    status,
    message,
  //  address,
  ];
}
