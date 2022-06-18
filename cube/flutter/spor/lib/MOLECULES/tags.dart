import 'package:flutter/cupertino.dart';
import 'package:spor/ATOMS/tag.dart';

const tags = ['bien etre', 'sport', 'social'];

class Tags extends StatelessWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: tags.map((e) => Tag(tag: e)).toList());
  }
}
