

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g8te_pass/common/fixtures.dart';
import 'package:g8te_pass/flavor_config.dart';
import 'package:g8te_pass/models/user_model.dart';

mixin MainFirestoreService {
  late FirebaseFirestore mDb;
  late CollectionReference mainCollection;
  String mainCollectionName = "";

  Future<void> mainCreate(UserModel user, String id) async {
    try {
      print("main ${mDb.app.name}");
      await mainCollection.doc(id).set({...user.toMap()}, SetOptions(merge: true));
    } catch (e) {
      ///throw an api response error incase
      print('error: $e');
    }
  }
}