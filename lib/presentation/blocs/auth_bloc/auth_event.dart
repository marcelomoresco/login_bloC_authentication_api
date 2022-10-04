// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthEvent {}

class LoggedInEvent extends AuthEvent {
  final String token;

  const LoggedInEvent({
    required this.token,
  });

  @override
  List<Object> get props => [token];

  @override
  String toString() => "Logado {$token}";
}

class LoggoutEvent extends AuthEvent {}
