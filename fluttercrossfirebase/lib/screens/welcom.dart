import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrossfirebase/screens/logIn.dart';
import 'package:fluttercrossfirebase/screens/register.dart';
import 'package:fluttercrossfirebase/widget/roundedButton.dart';

class Welcom extends StatefulWidget {
  static const String id = 'welcom_screen';
  const Welcom({Key? key}) : super(key: key);

  @override
  State<Welcom> createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {
  final _auth = FirebaseAuth.instance;

  void pushTOLogin() {
    Navigator.pushNamed(context, Login.id);
  }

  void pushToRegister() {
    Navigator.pushNamed(context, Register.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedButton(
              onPressed: pushTOLogin,
              text: 'login',
              color: Colors.blue,
            ),
            RoundedButton(
              onPressed: pushToRegister,
              text: 'register',
              color: Colors.lightBlue,
            )
          ],
        ),
      ),
    );
  }
}
