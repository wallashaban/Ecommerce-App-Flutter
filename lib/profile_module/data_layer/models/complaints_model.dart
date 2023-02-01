import 'package:e_commerce_app/profile_module/domain_layer/entities/complaints.dart';

class ComplaintModel extends Complaints{
 const ComplaintModel({ super.status =false,  super.message ='received',});
  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      status: json['status'],
      message: json['message'],
    );
  }
  
}