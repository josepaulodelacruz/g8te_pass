
import 'package:firebase_core/firebase_core.dart';
import 'package:g8te_pass/services/main-firestore-service.dart';
import 'package:g8te_pass/services/selected-firestore.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService extends MainFirestoreService with SelectedFirestoreService {
  FirebaseApp mainApp;
  FirebaseApp selectedApp;


  DatabaseService({required this.mainApp, required this.selectedApp}) : super(app: mainApp) {
    print("Current App: ${selectedApp}");
    db = FirebaseFirestore.instanceFor(app: selectedApp);
  }

  Future<void> addUserInMainFirebaseCollection() async {
    // await create();
    test();
  }
}