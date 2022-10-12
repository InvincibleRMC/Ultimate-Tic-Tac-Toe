import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';
import 'game.dart';

class GameConclusion extends StatefulWidget {
  const GameConclusion({super.key});
  final String title = "Victory Screen";
  final String home = "Return to Home";
  final String game = "Another game";
  @override
  State<GameConclusion> createState() => _GameConclusionState();
}

class _GameConclusionState extends State<GameConclusion> {
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
                      builder: (context) => const HomePage(),
                    ));
              },
              child: Text(widget.home),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                      ));
                },
                child: Text(widget.game))
          ],
        ),
      ),
    );
  }
}
