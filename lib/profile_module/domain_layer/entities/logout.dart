import 'package:equatable/equatable.dart';

class LogOut extends Equatable {
  final bool status;
  final String message;
  final int id;
  final String token;

  const LogOut(
 {
    required this.id,
    required this.token,  
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        id,
        token,
      ];
}
