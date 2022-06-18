import 'package:flutter/material.dart';
import 'package:personal_mind/ATOMS/ButtonAdd.dart';
import 'package:personal_mind/Methode/GetAndList.dart';
import 'package:personal_mind/Methode/string_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _stringStorage = StringStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('elooooo:WidgetsBinding.instance?.window.viewInsets.bottom');

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DefaultTextStyle(
            style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                decoration: TextDecoration.none),
            child: Scaffold(
                body: SafeArea(
                    child: SingleChildScrollView(
              child: Column(
                children: [
                  ButtonAdd(
                    storage: _stringStorage,
                  ),
                  GetAndList(
                    storage: _stringStorage,
                  ),
                ],
              ),
            )))));
  }
}
