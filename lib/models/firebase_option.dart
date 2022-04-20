
import 'package:equatable/equatable.dart';

class FirebaseOptionsModel extends Equatable {
  final String projectName;
  final String appId;
  final String apiKey;
  final String projectId;
  final String messagingSenderId;

  const FirebaseOptionsModel({
    this.projectName = "",
    this.appId = "",
    this.apiKey = "",
    this.projectId = "",
    this.messagingSenderId = "",
  });

  FirebaseOptionsModel copyWith({
    String? projectName,
    String? appId,
    String? apiKey,
    String? projectId,
    String? messagingSenderId,
  }) {
    return FirebaseOptionsModel(
      projectName: projectName ?? this.projectName,
      appId: appId ?? this.appId,
      apiKey: apiKey ?? this.apiKey,
      projectId: projectId ?? this.projectId,
      messagingSenderId: messagingSenderId ?? this.messagingSenderId,
    );
  }

  @override
  List<Object?> get props => [
    projectName,
    appId,
    apiKey,
    projectId,
    messagingSenderId,
  ];
}