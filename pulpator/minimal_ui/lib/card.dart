import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard({@required this.card});
  final card;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: Container(
        color: Colors.black,
        child: Center(
          child: Text(card),
        ),
      ),
    );
  }
}
