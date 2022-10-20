import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/boardTile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tileState.dart';

class SubBoard extends StatefulWidget {
  final double boardWidth;
  final double boardHeight;
  final int boardNum;

  @override
  State<SubBoard> createState() => _SubBoardState();

  SubBoard({
    Key? key,
    required this.boardWidth,
    required this.boardHeight,
    required this.boardNum,
  }) : super(key: key);
}

class _SubBoardState extends State<SubBoard> {
  var tileStatesList = List.filled(9, TileState.NONE);
  var turn = TileState.X;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/board.png',
            height: widget.boardHeight, width: widget.boardWidth),
        Container(
            //So X and Os line up
            //TODO
            // Could maybe be done better
            padding: EdgeInsets.symmetric(
              vertical: 70.0,
            ),
            child: subBoardTiles(widget.boardNum)),
      ],
    );
  }

  void updateTile(index) {
    //TODO
    //check if board is solved

    //TODO
    //check if this is a "current board"
    setState(() {
      if (tileStatesList[index] == TileState.NONE) {
        tileStatesList[index] = turn;

        if (turn == TileState.X) {
          turn = TileState.O;
        } else if (turn == TileState.O) {
          turn = TileState.X;
        }
      }
    });
    //TODO
    //set board solved if solved
    //If solved draw an X or O over the board
  }

  Widget subBoardTiles(boardNum) {
    return Builder(builder: (context) {
      final boardDim = MediaQuery.of(context).size.width / 3;
      final tileDim = boardDim / 3;
      const int boardCount = 3;
      final children = <Widget>[];

      for (int i = 0; i < boardCount; i++) {
        final childrenRow = <Widget>[];
        for (int j = 0; j < boardCount; j++) {
          childrenRow.add(
            BoardTile(
              x: i,
              y: j,
              tileState: tileStatesList[i * boardCount + j],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(i * boardCount + j),
            ),
          );
        }
        children.add(Row(children: childrenRow));
      }

      return Container(
          width: boardDim, height: boardDim, child: Column(children: children));
    });
  }
}
