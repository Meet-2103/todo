import 'package:flutter/material.dart';
import 'package:todo/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/statechange.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: state(),
    );
  }
}

