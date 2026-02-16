import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/date_source/auth_data_source.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/usecase/login_usecase.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(
        LoginUseCase(
          AuthRepositoryImpl(
            AuthRemoteDataSource(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Welcome ${state.email}")),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  TextField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: passCtrl,
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginRequested(
                          emailCtrl.text,
                          passCtrl.text,
                        ),
                      );
                    },
                    child: const Text("Login"),
                  ),
                  if (state is AuthFailure)
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
