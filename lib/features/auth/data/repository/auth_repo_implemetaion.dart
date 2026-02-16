import 'package:auth_repo_patten/features/auth/data/date_source/auth_data_source.dart';
import 'package:auth_repo_patten/features/auth/domain/entity/user.dart';
import 'package:auth_repo_patten/features/auth/domain/repository/auth_repository.dart';

class AuthDataSourceImp implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthDataSourceImp({required this.authRemoteDataSource});

  @override
  Future<User> login(String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}
