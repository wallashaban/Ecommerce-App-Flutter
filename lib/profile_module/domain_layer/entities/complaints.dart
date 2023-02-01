import 'package:equatable/equatable.dart';

class Complaints extends Equatable{
  final bool status;
 final String message;
 const Complaints({
    required this.status,
    required this.message,
  });
  
  @override
  List<Object?> get props => [
    status,
    message,
  ];
}
