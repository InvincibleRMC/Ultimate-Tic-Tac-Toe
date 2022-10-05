import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tile_state.dart';

import 'board_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _boardState = List.filled(9, TileState.EMPTY);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:
              Stack(children: [Image.asset('images/board.png'), _boardTiles()]),
        ),
      ),
    );
  }

  Widget _boardTiles() {
    return Builder(builder: (context) {
      final boardDimensions = MediaQuery.of(context).size.width;
      final tileDimension = boardDimensions / 3;

      return Container(
          width: boardDimensions,
          height: boardDimensions,
          child: Column(
              children: chunk(_boardState, 3).asMap().entries.map((entry) {
            final chunkIndex = entry.key;
            final tileStateChunk = entry.value;

            return Row(
              children: tileStateChunk.asMap().entries.map((innerEntry) {
                final innerIndex = innerEntry.key;
                final tileState = innerEntry.value;
                final tileIndex = (chunkIndex * 3) + innerIndex;

                return BoardTile(
                  dimension: tileDimension,
                  tileState: tileState,
                  onPressed: () => print('Tapped index $tileIndex'),
                );
              }).toList(),
            );
          }).toList()));
    });
  }
}
