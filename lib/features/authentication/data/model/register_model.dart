import 'package:tech_bloc/features/authentication/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.response,
    required super.userId,
  });

  factory RegisterModel.fromJson(Map<String,dynamic> json) {
    return RegisterModel(
      response: json["response"],
      userId: json["user_id"],
    );
  }
}