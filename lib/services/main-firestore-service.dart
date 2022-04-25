

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g8te_pass/flavor_config.dart';

mixin MainFirestoreService {
  late FirebaseFirestore mDb;
  late CollectionReference mainCollection;
  String mainCollectionName = "";

  mainCreate() async {
    try {
      print("main ${mDb.app.name}");
      await mainCollection.add({"test": "test"});
    } catch (e) {
      print('error: $e');
    }
  }
}