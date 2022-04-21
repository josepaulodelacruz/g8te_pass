

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

enum FirebaseStatus {
  waiting,
  loading,
  success,
  failed,
}

class FirebaseState extends Equatable {
  final FirebaseApp? app;
  final FirebaseStatus status;

  const FirebaseState._({
    this.app,
    this.status = FirebaseStatus.waiting,
  });

  const FirebaseState.unknown() : this._();

  FirebaseState copyWith({
    FirebaseApp? app,
    FirebaseStatus? status,
  }) {
    return FirebaseState._(
      app: app ?? this.app,
      status: status ?? this.status,
    );
  }


  @override
  List<Object?> get props => [app, status];
}