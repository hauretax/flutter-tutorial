import 'package:flutter/material.dart';

import 'card.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  String selectedCard = 'JOKER';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                PlayingCard(card: '1'),
                PlayingCard(card: '4'),
                PlayingCard(card: '3'),
                PlayingCard(card: ''),
              ],
            ),
            DropdownButton<String>(
              value: selectedCard,
              onChanged: (String? newValue) {
                print('new value');
                setState(() {
                  if (newValue != null) {
                    selectedCard = newValue;
                  }
                });
              },
              items: <String>['1', '3', '34', '2', 'JOKER']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextButton(
              style: const ButtonStyle(),
              onPressed: () {
                print('PLAYED');
              },
              child: const Text('PLAY'),
            )
          ],
        ),
      ),
    );
  }
}
