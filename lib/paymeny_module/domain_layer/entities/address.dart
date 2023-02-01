import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final String name;
  final String regoin;
  final String city;
  final String details;
  final String notes;
  final double longitude;
  final double latitude;
  const Address({
    required this.id,
    required this.name,
    required this.regoin,
    required this.city,
    required this.details,
    required this.notes,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        city,
        regoin,
        details,
        notes,
        latitude,
        longitude,
      ];
}
