import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class auth{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signin({
    required String mail,
    required String pass,
  }
      )async {
    await _firebaseAuth.signInWithEmailAndPassword(email: mail, password: pass);
  }

  Future<void> createuser({
    required String mail,
    required String pass,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: mail, password: pass);
    }

    Future<void> signout() async{
      _firebaseAuth.signOut();
    }

}

