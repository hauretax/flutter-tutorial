import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('DICE ME'),
          backgroundColor: Colors.amber,
        ),
        body: const CardsPage(),
      ),
    ),
  );
}

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  var dices = [3, 4, 1, 1];

  void getRandomCards(int nb) {
    setState(() {
      for (int i = 0; i < nb; i++) {
        dices[i] = Random().nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextButton(
                onPressed: () {
                  getRandomCards(dices.length);
                },
                child: Image.asset('images/b${dices[0].toString()}.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextButton(
                onPressed: () {
                  getRandomCards(dices.length);
                },
                child: Image.asset('images/b${dices[1].toString()}.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextButton(
                onPressed: () {
                  getRandomCards(dices.length);
                },
                child: Image.asset('images/b${dices[2].toString()}.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextButton(
                onPressed: () {
                  getRandomCards(dices.length);
                },
                child: Image.asset('images/b${dices[3].toString()}.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
