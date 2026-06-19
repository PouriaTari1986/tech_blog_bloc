




import 'package:dio/dio.dart';
import 'package:tech_bloc/core/utils/constants.dart';

class UpdateUserDataSource {

  final Dio dio;

  UpdateUserDataSource({required this.dio});

  Future<Map<String,dynamic>> updateUser(

  

  )async{

    Response response = await dio.post(Constants.userBaseUrl,queryParameters: {
      "command": "update",

    });
    return response.data;
  }
}