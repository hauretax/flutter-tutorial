import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    this.color = Colors.black,
    this.text = '',
    required this.onPressed,
  });

  final Color color;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onPressed();
            //Go to login screen.
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
