import 'package:firebase_core/firebase_core.dart';
import 'package:g8te_pass/models/firebase_option.dart';

List<FirebaseOptionsModel> options = [
  const FirebaseOptionsModel(
    projectName: "Saint Joseph Village 6",
    appId: "1:188291409218:android:e7c5cf39f7ab1d9c0f94db",
    apiKey: "AIzaSyAjTP7RBzX8Lri7xatRWzJmxJGytjnfEuU",
    projectId: "saint-joseph-6-association",
    messagingSenderId: "188291409218",
  ),
  const FirebaseOptionsModel(
    projectName: "Saint Joseph Village 8",
    appId: "1:55915945481:android:b06f34c14433cd8d6ae2d8",
    apiKey: "AIzaSyBpQvgDoIPU9vmG1dFIfRCsZD5Ja8GyvcM",
    projectId: "saint-joseph-8-association",
    messagingSenderId: "55915945481",
  ),
];


List<String> roles = [
  "Homeowner",
  "Passer-by (Vehicle)",
  "Doing Business Transactions",
];