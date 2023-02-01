import 'package:e_commerce_app/profile_module/domain_layer/entities/logout.dart';

class LogOutModel extends LogOut {
  const LogOutModel({
    required super.id,
    required super.token,
    required super.status,
    required super.message,
  });

  factory LogOutModel.fromJson(Map<String, dynamic> json) {
    return LogOutModel(
      id: json['data']['id'],
      token: json['data']['token'],
      status: json['status'],
      message: json['message'],
    );
  }
}
