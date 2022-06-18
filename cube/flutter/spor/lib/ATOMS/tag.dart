import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;

  const Tag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
      decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      child: Text(
        tag,
        style: const TextStyle(
            fontSize: 13, color: Colors.black, decoration: TextDecoration.none),
      ),
    );
  }
}
