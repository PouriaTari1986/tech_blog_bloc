import 'package:dio/dio.dart';
import 'package:tech_bloc/core/networks/shared_prefrenes.dart';
import 'package:tech_bloc/features/authentication/data/model/register_model.dart';
import 'package:tech_bloc/features/authentication/data/model/user_model.dart';
import 'package:tech_bloc/features/authentication/data/model/verify_code_model.dart';
import 'package:tech_bloc/features/home/data/models/categories_model.dart';
import 'package:tech_bloc/features/home/data/models/tags_model.dart';

class AuthApiProvider {
  final Dio dio;

  AuthApiProvider(this.dio);

  final String baseUrl =
      "https://techblog.sasansafari.com/Techblog/api";

      Future<RegisterModel> register(String email) async {
  var formData = FormData.fromMap({
    "email": email,
    "command": "register"
  });

  final response = await dio.post(
    "$baseUrl/register/action.php",
    data: formData,
  );

  return RegisterModel.fromJson(response.data);
}


Future<VerifyCodeModel> verifyCode({
  required String email,
  required String userId,
  required String code,
}) async {

  var formData = FormData.fromMap({
    "email": email,
    "user_id": userId,
    "code": code,
    "command": "verify"
  });

  final response = await dio.post(
    "$baseUrl/register/action.php",
    data: formData,
  );

  return VerifyCodeModel.fromJson(response.data);
}


Future<UserModel> getUser(String userId) async {

  final response = await dio.get(
    "$baseUrl/user/",
    queryParameters: {
      "command":"info",
      "user_id":userId
    },
    options: Options(
      headers: {
        "authorization":
            "Bearer ${await SharedPrefManager.getToken()}"
      },
    ),
  );

  return UserModel.fromJson(response.data["response"]);
}


Future<void> updateUser({
  required String userId,
  required String name,
}) async {

  await dio.post(
    "$baseUrl/user/?command=update",
    data: {
      "user_id": userId,
      "name": name,
    },
    options: Options(
      headers: {
        "authorization":
            "Bearer ${await SharedPrefManager.getToken()}"
      },
    ),
  );
}
Future<List<CategoryModel>> getCategories() async {

  final response = await dio.get(
    "$baseUrl/article/get.php?command=categories",
  );

  return response.data
      .map<CategoryModel>(
          (e) => CategoryModel.fromJson(e))
      .toList();
}
Future<List<TagModel>> getTags() async {

  final response = await dio.get(
    "$baseUrl/article/get.php?command=tags",
  );

  return response.data
      .map<TagModel>(
          (e) => TagModel.fromJson(e))
      .toList();
}
}