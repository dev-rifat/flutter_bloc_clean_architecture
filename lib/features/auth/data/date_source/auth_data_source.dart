import '../model/user_model.dart';


class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email == "test@gmail.com" && password == "123456") {
      return UserModel(id: "1", email: email);
    } else {
      throw Exception("Invalid credentials");
    }
  }
}
