import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEmail extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginEmail({this.email = "", this.password = ""});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'AuthLoginEmail { email: $email, password: $password }';
}

class AuthAddUserCredentials extends AuthEvent {
  final Map<String, String> userCredentials;

  const AuthAddUserCredentials({this.userCredentials = const {}});

  @override
  List<Object> get props => [userCredentials];

  @override
  String toString() => 'AuthAddUserCredentials { userCredentials: $userCredentials }';
}