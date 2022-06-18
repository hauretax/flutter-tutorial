import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrossfirebase/screens/chat.dart';
import 'package:fluttercrossfirebase/widget/roundedButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  static const String id = 'login_screen';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              RoundedButton(
                color: Colors.blue,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final logUser = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (logUser != null) {
                      pushToChat();
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    showSpinner = true;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
