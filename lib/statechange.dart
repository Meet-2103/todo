import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/login_page.dart';
import 'package:todo/main.dart';


class state extends StatefulWidget {
  const state({Key? key}) : super(key: key);
  @override
  State<state> createState() => _stateState();
}

class _stateState extends State<state> {
  @override
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return login_page();
          }
          else {
            return login_page();
          }
        }

    );
  }
}
