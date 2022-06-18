import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttercrossfirebase/screens/chat.dart';
import 'package:fluttercrossfirebase/screens/logIn.dart';
import 'package:fluttercrossfirebase/screens/register.dart';
import 'package:fluttercrossfirebase/screens/welcom.dart';
import 'package:fluttercrossfirebase/widget/roundedButton.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcom.id,
      routes: {
        Welcom.id: (context) => const Welcom(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}
