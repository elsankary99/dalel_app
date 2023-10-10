part of 'sign_up_provider.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

//? Sign Up
class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailure extends AuthState {
  final String message;
  const SignUpFailure(this.message);
}

//? Login
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String message;
  const LoginFailure(this.message);
}

//? termsAndCondition
class TermsAndCondition extends AuthState {}
