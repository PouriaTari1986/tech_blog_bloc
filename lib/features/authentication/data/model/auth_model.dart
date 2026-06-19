
import 'package:tech_bloc/features/authentication/domain/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    super.response,
    super.userId,
    super.token,
    super.message,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      response: json["response"] == true,
      userId: json["user_id"]?.toString(),
      token: json["token"]?.toString(),
      message: json["response"]?.toString(),
    );
  }
}