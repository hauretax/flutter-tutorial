import 'package:flutter/cupertino.dart';
import 'package:spor/MOLECULES/case.dart';
import 'package:spor/MOLECULES/progressBars.dart';
import 'package:spor/MOLECULES/tags.dart';

class Acte extends StatelessWidget {
  const Acte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        width: 200,
        child: Wrap(
          runSpacing: 8.0,
          children: const [
            Activty(),
            Tags(),
            ProgressBars(),
          ],
        ));
  }
}
