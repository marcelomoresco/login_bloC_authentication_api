// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:authentication_login/repositories/login_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  AuthBloc({
    required this.userRepository,
  }) : super(AuthenticationInitializedState()) {
    on<AppStartedEvent>(_appStartedEvent);
    on<LoggedInEvent>(_onLoggedInEvent);
    on<LoggoutEvent>(_onLoggoutEvent);
  }

  void _appStartedEvent(AppStartedEvent event, Emitter<AuthState> emit) async {
    final bool hasToken = await userRepository.hasToken();
    if (hasToken) {
      emit(AuthAuthenticatedState());
    } else {
      emit(AuthUnAuthenticatedState());
    }
  }

  void _onLoggedInEvent(LoggedInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await userRepository.persisteToken(event.token);
    emit(AuthAuthenticatedState());
  }

  void _onLoggoutEvent(LoggoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await userRepository.deleteToken();
    emit(AuthUnAuthenticatedState());
  }
}
