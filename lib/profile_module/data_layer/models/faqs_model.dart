import 'package:e_commerce_app/profile_module/domain_layer/entities/faqs.dart';

class FaqModel extends Faqs{
  FaqModel({required super.id, required super.question, required super.answer,});
  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}
