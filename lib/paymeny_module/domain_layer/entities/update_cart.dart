import 'package:equatable/equatable.dart';

class UpdateCart extends Equatable {
  final bool status;
  final String message;
  final String quantity;
  const UpdateCart({
    required this.status,
    required this.message,
    required this.quantity,
  });
  @override
  List<Object?> get props => [
        status,
        message,
        quantity,
      ];
}
