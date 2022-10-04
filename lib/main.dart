import 'package:authentication_login/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:authentication_login/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:authentication_login/presentation/views/home/home_page.dart';
import 'package:authentication_login/presentation/views/login/login_page.dart';
import 'package:authentication_login/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(userRepository: userRepository)
        ..add(
          AppStartedEvent(),
        ),
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(
            userRepository: userRepository,
            authBloc: context.read<AuthBloc>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticatedState) {
              return const HomePage();
            } else if (state is AuthUnAuthenticatedState) {
              return LoginPage(
                userRepository: UserRepository(),
              );
            } else if (state is AuthLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text("Erro ao carregar dados!"),
              );
            }
          },
        ),
      ),
    );
  }
}
