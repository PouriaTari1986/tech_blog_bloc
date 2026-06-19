


import 'package:dio/dio.dart';
import 'package:tech_bloc/core/utils/constants.dart';

class GetUserDataSource {
  final Dio dio;

  GetUserDataSource({required this.dio});

  Future<Map<String,dynamic>> getUserInfo(
    String userId,
  )async{

    var response = await dio.get(Constants.userBaseUrl,queryParameters: {
      "command": "info",
      "user_id": userId
    });
    return response.data;
  }
}