import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../date_source/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<User> login(String email, String password) async {
    try {
      final user = await authDataSource.login(email, password);
      return user;
    } catch (e) {
      throw Exception('Login failed: \$e');
    }
  }
}
