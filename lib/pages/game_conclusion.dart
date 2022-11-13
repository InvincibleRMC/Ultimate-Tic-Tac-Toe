import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'game.dart';

class GameConclusion extends StatelessWidget {
  const GameConclusion({
    Key? key,
    required TileState winner,
  })  : _winner = winner,
        super(key: key);

  final TileState _winner;
  final String _home = "Return to Home";
  final String _game = "Another game";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _winnerToString(_winner),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              child: Text(_home),
            ),
            ElevatedButton(
                key: const Key("game_button"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                      ));
                },
                child: Text(_game))
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
