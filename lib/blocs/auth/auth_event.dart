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