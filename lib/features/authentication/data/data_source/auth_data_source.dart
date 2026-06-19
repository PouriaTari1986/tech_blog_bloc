import 'package:dio/dio.dart';
import 'package:tech_bloc/features/authentication/data/model/auth_model.dart';


class AuthDataSource {

  final Dio dio;

  AuthDataSource(this.dio);

  Future<AuthModel> registerEmail({
    required String email,
    required String command,
  }) async {

    FormData formData = FormData.fromMap({
      "email": email,
      "command": command,
    });

    final response = await dio.post(
      "https://techblog.sasansafari.com/Techblog/api/register/action.php",
      data: formData,
    );

    return AuthModel.fromJson(response.data);
  }

  Future<AuthModel> verifyCode({
    required String email,
    required String userId,
    required String code,
    required String command,
  }) async {

    FormData formData = FormData.fromMap({
      "email": email,
      "user_id": userId,
      "code": code,
      "command": command,
    });

    final response = await dio.post(
      "https://techblog.sasansafari.com/Techblog/api/register/action.php",
      data: formData,
    );

    return AuthModel.fromJson(response.data);
  }
}