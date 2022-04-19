
import 'package:equatable/equatable.dart';

class FirebaseOptionsModel extends Equatable {
  final String associationName;
  final String appId;
  final String apiKey;
  final String projectId;
  final String messagingSenderId;

  const FirebaseOptionsModel({
    this.associationName = "",
    this.appId = "",
    this.apiKey = "",
    this.projectId = "",
    this.messagingSenderId = "",
  });

  FirebaseOptionsModel copyWith({
    String? associationName,
    String? appId,
    String? apiKey,
    String? projectId,
    String? messagingSenderId,
  }) {
    return FirebaseOptionsModel(
      associationName: associationName ?? this.associationName,
      appId: appId ?? this.appId,
      apiKey: apiKey ?? this.apiKey,
      projectId: projectId ?? this.projectId,
      messagingSenderId: messagingSenderId ?? this.messagingSenderId,
    );
  }

  @override
  List<Object?> get props => [
    associationName,
    appId,
    apiKey,
    projectId,
    messagingSenderId,
  ];
}