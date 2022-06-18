import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StringStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<String> readString() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<File> writeString(String text) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(text);
  }
}
