import 'package:equatable/equatable.dart';

class Contacts extends Equatable {
  final int id;
  final int type;
  final String? value;
  final String? message;
  const Contacts({
    required this.id,
    required this.type,
    required this.value,
    required this.message,
  });

  @override
  List<Object?> get props => [
    id,
    type,
    value,
    message,
  ];
}
