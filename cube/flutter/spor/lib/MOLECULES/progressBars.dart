/// MOLECULES used to see 3 progression in line
///
/// todo:
/// give a progression in % autofill the bar
/// upgradeable :
/// - implement a way to have more or less then 3 bar
/// - choose a color during progression

import 'package:flutter/material.dart';
import 'package:spor/ATOMS/progressBar.dart';

class ProgressBars extends StatelessWidget {
  const ProgressBars({Key? key}) : super(key: key);
  final investment = 20;
  final feelingProgress = 50;
  final realProgress = 95;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: ProgressBar(progress: investment)),
      const SizedBox(width: 2),
      Expanded(child: ProgressBar(progress: feelingProgress)),
      const SizedBox(width: 2),
      Expanded(child: ProgressBar(progress: realProgress)),
    ]);
  }
}
