
import 'package:auth_repo_patten/features/auth/domain/entity/user.dart';

class UserModel extends User{
  UserModel({required super.id, required super.email});


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
    );
  }




}

