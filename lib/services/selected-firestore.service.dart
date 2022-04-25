

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g8te_pass/flavor_config.dart';
import 'package:g8te_pass/models/user_model.dart';

mixin SelectedFirestoreService {
  late FirebaseFirestore db;
  late CollectionReference collection;
  String collectionName = "";


  Future<void> create(UserModel user, String id) async {
    try {
      await collection.doc(id).set({
        ...user.toMap()},
          SetOptions(merge: true));
    } catch (e) {
      ///throw api error
      print('error: $e');
    }
  }

  test() async {
    print('selected firebase db');
    await collection.add({'test': 'test'});
  }
}