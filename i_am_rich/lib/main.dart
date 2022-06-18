import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black54,
          appBar: AppBar(
            title: const Text('I am riche'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: const Center(
            child: Image(
              image: AssetImage(
                'images/oui.jpg',
              ),
            ),
          ),
        ),
      ),
    );
