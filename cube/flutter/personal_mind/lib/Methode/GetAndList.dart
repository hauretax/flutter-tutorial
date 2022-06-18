import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:personal_mind/Methode/string_storage.dart';

class GetAndList extends StatefulWidget {
  const GetAndList({Key? key, required this.storage}) : super(key: key);

  final StringStorage storage;

  @override
  _GetAndListState createState() => _GetAndListState();
}

class _GetAndListState extends State<GetAndList> {
  String _text = '';

  @override
  void initState() {
    super.initState();
    widget.storage.readString().then((String value) {
      setState(() {
        _text = value;
      });
    });
  }

  Future<File> _changeValue(oui) {
    setState(() {
      oui;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeString(oui);
  }

  @override
  Widget build(BuildContext context) {
    return Text('appData say: $_text');

    /*Column fileWay(oui) {
    print('param:' + oui);
    writeCounter(oui);
    print('content file');
    print(readCounter());
    return Column(
      children: [Text(readCounter())],
    );
*/
    //children: faker.lorem.sentences(150).map((e) => Text(e)).toList());
  }
}
