import 'package:equatable/equatable.dart';
import 'package:g8te_pass/models/user_model.dart';

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
  final UserModel userCredentials;

  const AuthAddUserCredentials({this.userCredentials = UserModel.empty});

  @override
  List<Object> get props => [userCredentials];

  @override
  String toString() => 'AuthAddUserCredentials { userCredentials: $userCredentials }';
}