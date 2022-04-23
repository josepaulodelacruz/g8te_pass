

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g8te_pass/blocs/firebase/firebase_event.dart';
import 'package:g8te_pass/blocs/firebase/firebase_state.dart';
import 'package:g8te_pass/services/database-service.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {

  FirebaseBloc() : super(const FirebaseState.unknown()) {
    on<FirebaseMainProject>(_initializeMainFirebaseProject);
    on<FirebaseSelectProject>(_selectFirebaseApp);
  }

  void _initializeMainFirebaseProject (FirebaseMainProject event, Emitter<FirebaseState> emit) async {
    emit(state.copyWith(mainApp: event.defaultApp));
  }

  void _selectFirebaseApp(FirebaseSelectProject event, Emitter<FirebaseState> emit) async {
    emit(state.copyWith(status: FirebaseStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    if(state.app != null && event.selectedApp != state.app) {
      //delete previous initialize firebase project
      print('deleting prev app');
      emit(state.copyWith(status: FirebaseStatus.deleting));
    }
    emit(state.copyWith(status: FirebaseStatus.success, app: event.selectedApp));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: FirebaseStatus.waiting));
  }

}