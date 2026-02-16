import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(event.email, event.password);
      emit(AuthSuccess(user.email));
    } catch (e) {
      emit(AuthFailure("Login failed"));
    }
  }
}


