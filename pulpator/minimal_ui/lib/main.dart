import 'package:flutter/material.dart';
import 'package:minimal_ui/connexion.dart';
import 'package:minimal_ui/gameBorad.dart';

import 'package:socket_io_client/socket_io_client.dart';

void main() {
  Socket socket = io('http://localhost:3066');
  socket.emit('msg', 'test');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Connexion(),
        '/game': (context) => const GameBoard()
      },
    );
  }
}
