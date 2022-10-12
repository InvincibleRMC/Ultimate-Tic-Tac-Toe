import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/settings.dart';

import 'game_settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  final String title = "Home";
  final String gameSettings = "Play Game";
  final String settings = "Settings";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
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
              child: Text(widget.gameSettings),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppSettings(),
                      ));
                },
                child: Text(widget.settings))
          ],
        ),
      ),
    );
  }
}
