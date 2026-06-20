

import 'package:tech_bloc/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.status, required super.msg});


  factory UserModel.fromJson(Map<String,dynamic> json){

    return UserModel(
      status: json["status"], 
      msg: json["msg"]);
  }
}