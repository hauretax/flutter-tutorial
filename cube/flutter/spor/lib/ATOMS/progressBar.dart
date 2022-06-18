import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final dynamic progress;

  const ProgressBar({Key? key, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 20,
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: constraints.maxWidth * progress / 100,
                    height: 20,
                    child: Container(
                      color: Colors.orange,
                    ),
                  ))));
    });
  }
}
