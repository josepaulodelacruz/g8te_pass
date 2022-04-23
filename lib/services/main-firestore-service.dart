

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g8te_pass/flavor_config.dart';

class MainFirestoreService {
  late FirebaseFirestore mDb;
  late CollectionReference collection;
  String collectionName = "";

  MainFirestoreService({required FirebaseApp app, required String collectionName}) {
    String namespace = FlavorConfig.instance.values.namespace;
    mDb = FirebaseFirestore.instanceFor(app: app);
    this.collectionName = "$namespace$collectionName";
    print(this.collectionName);
    collection = mDb.collection(collectionName);
    print('main database mDb: $mDb');
  }

  create() async {
    try {
      await mDb.collection('test').add({'test': 'test'});
    } catch (e) {
      print('error: $e');
    }
  }
}