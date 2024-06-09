import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();

  String? message='';
  bool login=true;

  Future<void>signin()async{
    try{
      await auth().signin(
      mail: email.text,
      pass: pass.text,
      );
          }on FirebaseAuthException catch(e) {
      setState(() {
        message = e.message;
      });
    }
}

Future<void> create()async {
  try {
    await auth().createuser(mail: email.text, pass: pass.text);
  }on FirebaseAuthException catch(e){
    setState(() {
      message=e.message;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
         child:

         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: null, child: Text("Register")),
              ],
            ),
            const SizedBox(
              height: 250,
            ),
            TextField(
              decoration: InputDecoration(labelText:"email"),
              controller: email,
            ),
            TextField(
              decoration: InputDecoration(labelText:"password"),
              controller: pass,
            ),
            ElevatedButton(onPressed:
                login ? signin : create,
                 child: Text(login ? 'LOGIN' : "REGISTER")),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("forgot password?"),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  child: Image.network("https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1"),
                ),
                const SizedBox(
                  height: 25,
                  child: Text("PHONE LOGIN",
                  style: TextStyle(fontSize: 25),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
