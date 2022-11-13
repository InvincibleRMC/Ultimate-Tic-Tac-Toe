import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/app_settings.dart';

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
              key: const Key("game_settings_button"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const GameSettings(key: Key("game_settings")),
                    ));
              },
              child: Text(_gameSettings),
            ),
            ElevatedButton(
                key: const Key("app_settings_button"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AppSettings(key: Key("app_settings")),
                      ));
                },
                child: Text(_settings))
          ],
        ),
      ),
    );
  }
}
