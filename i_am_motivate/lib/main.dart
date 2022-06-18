import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: const Center(
          child: Text('hello guttci boy'),
        ),
        backgroundColor: Colors.brown,
      ),
      body: const Center(
        child: Image(
          image: AssetImage(
            'images/just-do-it-do-it.gif',
          ),
        ),
      ),
    ),
  ));
}
