import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'game.dart';

class GameConclusion extends StatefulWidget {
  const GameConclusion({
    Key? key,
    required TileState winner,
  })  : _winner = winner,
        super(key: key);

  final TileState _winner;
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
          _winnerToString(widget._winner),
        ),
      ),
      body: Center(
        child: Row(
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

String _winnerToString(TileState t) {
  switch (t) {
    case TileState.none:
      return "Tie!";

    case TileState.O:
      return "O Player Wins!";

    case TileState.X:
      return "X Player Wins!";
  }
}
