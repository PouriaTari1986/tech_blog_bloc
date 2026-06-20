import 'package:tech_bloc/features/authentication/domain/entities/verify_code_entity.dart';

class VerifyCodeModel extends VerifyCodeEntity {
  const VerifyCodeModel({
    required super.response,
    required super.userId,
    required super.token,
  });

  factory VerifyCodeModel.fromJson(Map<String,dynamic> json) {
    return VerifyCodeModel(
      response: json["response"],
      userId: json["user_id"],
      token: json["token"],
    );
  }
}