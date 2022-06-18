import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrossfirebase/screens/chat.dart';
import 'package:fluttercrossfirebase/widget/roundedButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatefulWidget {
  static const String id = 'registration_screen';
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String email = '';
  String password = '';

  pushToChat() {
    Navigator.pushNamed(context, ChatScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'enter ur email'),
                onChanged: (value) => email = value,
              ),
              TextField(
                obscureText: true,
                decoration:
                    const InputDecoration(hintText: 'enter ur passowrd'),
                onChanged: (value) => password = value,
              ),
              RoundedButton(onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    pushToChat();
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  print(e);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
