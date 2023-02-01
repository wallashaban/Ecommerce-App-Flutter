import 'package:e_commerce_app/profile_module/domain_layer/entities/notification.dart';

class NotificationsModel extends Notification {
  NotificationsModel({
    required super.id,
    required super.title,
    required super.message,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
    );
  }
}
