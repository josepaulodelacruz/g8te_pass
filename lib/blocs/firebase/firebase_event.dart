
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseEvent extends Equatable {
  const FirebaseEvent();
  @override
  List<Object> get props => [];
}

class FirebaseSelectProject extends FirebaseEvent {
  final FirebaseApp? selectedApp;

  const FirebaseSelectProject({
    this.selectedApp,
  });

  @override
  List<Object> get props => [];
}
