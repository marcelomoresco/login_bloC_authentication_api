// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:authentication_login/repositories/login_repository.dart';

import '../auth_bloc/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({
    required this.userRepository,
    required this.authBloc,
  }) : super(LoginInitialState()) {
    on<LoginBtnPressed>(_onLoginBtnPressed);
  }

  void _onLoginBtnPressed(
      LoginBtnPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      final token = await userRepository.login(
        event.email,
        event.password,
      );
      authBloc.add(
        LoggedInEvent(token: token),
      );

      emit(LoginInitialState());
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
    }
  }
}
