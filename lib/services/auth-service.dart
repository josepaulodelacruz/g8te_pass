
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  late FirebaseAuth? auth;

  AuthService({
    this.auth,
  });

  Future<Map<String, dynamic>> createAuth({required String email, required String password}) async {
    try {
      print("creating auth user $email $password");
      var result = await auth!.createUserWithEmailAndPassword(
          email: email, password: password);
      auth!.signInWithEmailAndPassword(email: email, password: password);
      return {
        "failed": false,
        "id": result.user!.uid,
        "message": "You have successfully signed up!",
      };
    } catch (e) {
      print(e);
      print("failed creating email password");
      // throw Exception('Error encountered. Please try again.');
      return {
        "failed": true,
        "id": null,
        "message": e.toString(),
      };
    }
  }

}
