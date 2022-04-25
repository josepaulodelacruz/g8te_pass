
import 'package:firebase_core/firebase_core.dart';
import 'package:g8te_pass/flavor_config.dart';
import 'package:g8te_pass/services/main-firestore-service.dart';
import 'package:g8te_pass/services/selected-firestore.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService with MainFirestoreService, SelectedFirestoreService {
  String namespace = FlavorConfig.instance.values.namespace;
  FirebaseApp mainApp;
  FirebaseApp selectedApp;

  UserDatabaseService({required this.mainApp, required this.selectedApp}) : super() {
    print("Current main app: ${mainApp.name}");
    print("Current selected App: ${selectedApp}");
    mDb = FirebaseFirestore.instanceFor(app: mainApp);
    mainCollectionName =  "${namespace}accounts";
    mainCollection = mDb.collection(mainCollectionName);
    db = FirebaseFirestore.instanceFor(app: selectedApp);
    collectionName = "${namespace}accounts";
    collection = db.collection(collectionName);
  }

  Future<void> addUserInMainFirebaseCollection() async {
    try {
      mainCreate();
      create();
      // test();
    } catch (err) {
      throw Exception('Something went wrong');
    }
  }
}