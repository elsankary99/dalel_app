part of 'auth_provider.dart';

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

//? logout
class LogOutLoading extends AuthState {}

class LogOutSuccess extends AuthState {}

class LogOutFailure extends AuthState {
  final String message;
  const LogOutFailure(this.message);
}

//? Reset Password
class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordFailure extends AuthState {
  final String message;
  const ResetPasswordFailure(this.message);
}

//? termsAndCondition
class TermsAndCondition extends AuthState {}
