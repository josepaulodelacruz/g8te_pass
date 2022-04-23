

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

mixin SelectedFirestoreService {
  late FirebaseFirestore db;

  // SelectedFirestoreService({required FirebaseApp app}) {
  //   db = FirebaseFirestore.instanceFor(app: app);
  //   print('db: $db');
  // }

  create() async {
    try {
      await db.collection('test').add({'test': 'test'});
    } catch (e) {
      print('error: $e');
    }
  }

  test() async {
    print('selected firebase db');
    await db.collection('test').add({'test': 'test'});

  }
}