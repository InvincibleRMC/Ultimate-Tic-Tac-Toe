import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/settings.dart';

import 'game_settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String _title = "Home";
  final String _gameSettings = "Play Game";
  final String _settings = "Settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameSettings(),
                    ));
              },
              child: Text(_gameSettings),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppSettings(),
                      ));
                },
                child: Text(_settings))
          ],
        ),
      ),
    );
  }
}
