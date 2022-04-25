import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  final FirebaseApp selectedApp;

  const AuthAddUserCredentials({this.userCredentials = UserModel.empty, required this.selectedApp});

  @override
  List<Object> get props => [userCredentials, selectedApp];

  @override
  String toString() => 'AuthAddUserCredentials { userCredentials: $userCredentials }';
}