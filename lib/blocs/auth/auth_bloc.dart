import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g8te_pass/blocs/auth/auth_event.dart';
import 'package:g8te_pass/blocs/auth/auth_state.dart';
import 'package:g8te_pass/services/auth-service.dart';
import 'package:g8te_pass/services/user-database-service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService;
  UserDatabaseService databaseService;

  AuthBloc({required this.authService, required this.databaseService})
      : super(const AuthState.unknown()) {
    on<AuthLoginEmail>(_loginEmail);
    on<AuthAddUserCredentials>(_addUserCredentials);
  }

  void _loginEmail(AuthLoginEmail event, Emitter<AuthState> emit) async {
    var result = await authService.createAuth(
        email: event.email, password: event.password);
    emit(state.copyWith(status: AuthStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    if (!result['failed']) {
      emit(state.copyWith(
          status: AuthStatus.login,
          loginMessage:
              "You have successfully created an account! Please wait for the administrator to approve your account."));
    } else {
      emit(state.copyWith(
          status: AuthStatus.failed,
          loginMessage:
              "The email address is already in use by another account."));
    }
    emit(state.copyWith(status: AuthStatus.waiting));
  }

  void _addUserCredentials(
      AuthAddUserCredentials event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    authService= AuthService(auth: FirebaseAuth.instanceFor(app: event.selectedApp)); // selection of which auth to use
    var result = await authService.createAuth(
        email: event.userCredentials.emailAddress,
        password: event.userCredentials.password);
    if (!result['failed']) {
      var _user = event.userCredentials.copyWith(id: result['id']);
      await databaseService.addUserInMainFirebaseCollection(user: _user);
      emit(state.copyWith(
          user: _user,
          status: AuthStatus.login,
          loginMessage:
              "You have successfully created an account! Please wait for the administrator to approve your account."));
    } else {
      emit(state.copyWith(
          status: AuthStatus.failed,
          loginMessage:
              "The email address is already in use by another account."));
    }

    emit(state.copyWith(status: AuthStatus.waiting));

  }
}
