import 'package:e_commerce_app/profile_module/domain_layer/entities/contacts.dart';

class ContactsModel extends Contacts {
 const ContactsModel({
    required super.id,
    required super.type,
    required super.value,
    required super.message,
  });

  factory ContactsModel.formJson(Map<String, dynamic> json) {
    return ContactsModel(
      id: json['id'],
      type: json['type'],
      value: json['value'],
      message: json['message'],
    );
  }
}
