

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

enum FirebaseStatus {
  waiting,
  loading,
  success,
  failed,
  deleting,
}

class FirebaseState extends Equatable {
  final FirebaseApp? mainApp;
  final FirebaseApp? app;
  final FirebaseStatus status;

  const FirebaseState._({
    this.mainApp,
    this.app,
    this.status = FirebaseStatus.waiting,
  });

  const FirebaseState.unknown() : this._();

  FirebaseState copyWith({
    FirebaseApp? mainApp,
    FirebaseApp? app,
    FirebaseStatus? status,
  }) {
    return FirebaseState._(
      mainApp: mainApp ?? this.mainApp,
      app: app ?? this.app,
      status: status ?? this.status,
    );
  }


  @override
  List<Object?> get props => [
    mainApp,
    app,
    status
  ];
}