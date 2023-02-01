import 'package:equatable/equatable.dart';

class Authentication extends Equatable {
 final bool status;
 final String message;
 final int id;
 final String name;
 final String email;
 final String phone;
 final String token;
 final String image;
 const Authentication({
    required this.status,
    required this.message,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
    required this.image,
  });
  
  @override
  List<Object> get props {
    return [
      status,
      message,
      id,
      name,
      email,
      phone,
      token,
      image,
    ];
  }

  Authentication copyWith({
    bool? status,
    String? message,
    int? id,
    String? name,
    String? email,
    String? phone,
    String? token,
    String? image,
  }) {
    return Authentication(
      status: status ?? this.status,
      message: message ?? this.message,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      token: token ?? this.token,
      image: image ?? this.image,
    );
  }
}
