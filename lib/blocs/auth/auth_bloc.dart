
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g8te_pass/blocs/auth/auth_event.dart';
import 'package:g8te_pass/blocs/auth/auth_state.dart';
import 'package:g8te_pass/services/auth-service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService;

  AuthBloc({required this.authService}) : super(const AuthState.unknown()) {
    on<AuthLoginEmail>(_loginEmail);
  }

  void _loginEmail(AuthLoginEmail event, Emitter<AuthState> emit) async {
    var result = await authService.createAuth(email: event.email, password: event.password);
    emit(state.copyWith(status: AuthStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    if(!result['failed']) {
      emit(state.copyWith(status: AuthStatus.login, loginMessage: "You have successfully created an account! Please wait for the administrator to approve your account."));
    } else {
      emit(state.copyWith(status: AuthStatus.failed, loginMessage: "The email address is already in use by another account."));
    }
    emit(state.copyWith(status: AuthStatus.waiting));
  }

}