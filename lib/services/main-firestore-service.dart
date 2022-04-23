

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainFirestoreService {
  late FirebaseFirestore mDb;

  MainFirestoreService({required FirebaseApp app}) {
    mDb = FirebaseFirestore.instanceFor(app: app);
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