import 'package:e_commerce_app/profile_module/domain_layer/entities/settings.dart';

class SettingsModel extends Settings {
  const SettingsModel({required super.about, required super.terms});

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      about: json['about'],
      terms: json['terms'],
    );
  }
}
