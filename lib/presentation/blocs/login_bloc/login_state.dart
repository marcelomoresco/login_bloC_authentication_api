// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Error no Login { error: $message }';
}
