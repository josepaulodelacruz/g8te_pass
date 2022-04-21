

import 'package:equatable/equatable.dart';

enum AuthStatus {
  loading,
  waiting,
  login,
  failed,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final String loginMessage;

  const AuthState._({
    this.status = AuthStatus.waiting,
    this.loginMessage = "",
  });

  const AuthState.unknown() : this._();

  AuthState copyWith({
    AuthStatus? status,
    String? loginMessage,
  }) {
    return AuthState._(
      status: status ?? this.status,
      loginMessage: loginMessage ?? this.loginMessage,
    );
  }

  @override
  List<Object> get props => [
    status,
    loginMessage,
  ];
}
