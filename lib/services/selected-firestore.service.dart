

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g8te_pass/flavor_config.dart';

mixin SelectedFirestoreService {
  late FirebaseFirestore db;
  late CollectionReference collection;
  String collectionName = "";


  create() async {
    try {
      print("selected db is ${db.app}");
      await db.collection('test').add({'test': 'test'});
    } catch (e) {
      print('error: $e');
    }
  }

  test() async {
    print('selected firebase db');
    await collection.add({'test': 'test'});
  }
}