import 'package:flutter/material.dart';

class Activty extends StatelessWidget {
  const Activty({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Text(
        'courire',
        style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            decorationColor: Colors.white,
            decoration: TextDecoration.none),
      ),
      Spacer(),
      Icon(
        Icons.directions_run,
        color: Colors.purple,
        size: 30,
      ),
    ]);
  }
}
