import 'package:flutter/material.dart';
import 'package:personal_mind/Methode/string_storage.dart';
import 'package:personal_mind/ORGANISMS/ModalForm.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({Key? key, required this.storage}) : super(key: key);

  final StringStorage storage;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.add_box_rounded),
        tooltip: 'write note',
        onPressed: () => {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return ModalForm(storage: storage);
                },
              )
            });
  }
}
