import 'package:flutter/material.dart';
import 'package:spor/ORGANISMS/Acte.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'mess essaies',
        theme: ThemeData(
            primarySwatch: Colors.blue, backgroundColor: Colors.white30),
        home: const Happy());
  }
}

class Happy extends StatelessWidget {
  const Happy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Wrap(spacing: 8, runSpacing: 8, children: const <Widget>[
      Acte(),
      Acte(),
      Acte(),
      Acte(),
    ]));
  }
}
