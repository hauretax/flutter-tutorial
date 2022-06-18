import 'package:flutter/material.dart';

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pseudo',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'game  room',
              ),
            ),
            TextButton(
              style: const ButtonStyle(),
              onPressed: () {
                print('coucou');
                Navigator.pushNamed(context, '/game');
              },
              child: const Text('Launch Game'),
            )
          ],
        ),
      ),
    );
  }
}
