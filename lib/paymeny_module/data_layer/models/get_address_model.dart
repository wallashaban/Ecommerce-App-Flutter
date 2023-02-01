import 'package:e_commerce_app/paymeny_module/domain_layer/entities/address.dart';

class GetAddressModel extends Address {
  const GetAddressModel({
    required super.id,
    required super.name,
    required super.regoin,
    required super.city,
    required super.details,
    required super.notes,
    required super.longitude,
    required super.latitude,
  });

  factory GetAddressModel.fromJson(Map<String, dynamic> json) {
    return GetAddressModel(
      id: json['id'],
      name: json['name']??'',
      regoin: json['region']??'',
      city: json['city']??'',
      details: json['details']??'',
      notes: json['notes']??'',
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
    );
  }
}
