import 'package:flutter/cupertino.dart';
import 'package:faker/faker.dart';

class Moment extends StatelessWidget {
  const Moment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(faker.lorem.sentence())),
        Container(width: 10, height: 20, color: const Color(0x008f8f8f)),
        Expanded(child: Text(faker.lorem.sentence())),
        Container(width: 10, height: 20, color: const Color(0x008f8f8f)),
        Expanded(child: Text(faker.lorem.sentence())),
      ],
    );
  }
}
