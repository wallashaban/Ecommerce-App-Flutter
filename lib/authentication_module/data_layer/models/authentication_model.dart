import 'package:e_commerce_app/authentication_module/domain_layer/entities/authentication.dart';

class AuthenticationModel extends Authentication {
 const AuthenticationModel({
     super.status=false,
     super.message='',
     super.id=1,
     super.name='',
     super.email='',
     super.phone='',
     super.token='',
     super.image='',
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) => AuthenticationModel(
        status: json['status'],
        message: json['message']??'',
        id: json['data']['id'],
        name: json['data']['name'],
        email: json['data']['email'],
        phone: json['data']['phone'],
        token: json['data']['token'],
        image: json['data']['image'],
      );
}
