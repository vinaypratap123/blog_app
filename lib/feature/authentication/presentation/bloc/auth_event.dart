part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUpEvent extends AuthEvent {
  final String fullName;
  final String email;
  final String password;

  AuthSignUpEvent({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
