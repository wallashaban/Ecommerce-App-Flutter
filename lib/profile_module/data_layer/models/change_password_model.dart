import 'package:e_commerce_app/profile_module/domain_layer/entities/change_password.dart';

class ChangePasswordModel extends ChangePassword {
  const ChangePasswordModel({
    required super.status,
    required super.message,
  });
  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
