

import 'package:equatable/equatable.dart';
import 'package:g8te_pass/models/user_model.dart';

enum AuthStatus {
  loading,
  waiting,
  login,
  failed,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final String loginMessage;
  final UserModel user;

  const AuthState._({
    this.status = AuthStatus.waiting,
    this.loginMessage = "",
    this.user = UserModel.empty,
  });

  const AuthState.unknown() : this._();

  AuthState copyWith({
    AuthStatus? status,
    String? loginMessage,
    UserModel? user,
  }) {
    return AuthState._(
      status: status ?? this.status,
      loginMessage: loginMessage ?? this.loginMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
    status,
    loginMessage,
    user,
  ];
}
