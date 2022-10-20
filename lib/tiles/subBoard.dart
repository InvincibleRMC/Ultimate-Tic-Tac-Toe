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
            padding: EdgeInsets.symmetric(
              vertical: 0.0,
            ),
            child: subBoardTiles(widget.boardNum)),
      ],
    );
  }

  void updateTile(index) {
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
  }

  Widget subBoardTiles(boardNum) {
    return Builder(builder: (context) {
      final boardDim = MediaQuery.of(context).size.width / 3;
      final tileDim = boardDim / 3;

      return Container(
        width: boardDim,
        height: boardDim,
        child: Column(children: [
          Row(children: [
            BoardTile(
              x: 0,
              y: 2,
              tileState: tileStatesList[0],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(0),
            ),
            BoardTile(
              x: 1,
              y: 2,
              tileState: tileStatesList[1],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(1),
            ),
            BoardTile(
              x: 2,
              y: 2,
              tileState: tileStatesList[2],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(2),
            ),
          ]),
          Row(children: [
            BoardTile(
              x: 0,
              y: 1,
              tileState: tileStatesList[3],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(3),
            ),
            BoardTile(
              x: 1,
              y: 1,
              tileState: tileStatesList[4],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(4),
            ),
            BoardTile(
              x: 2,
              y: 1,
              tileState: tileStatesList[5],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(5),
            ),
          ]),
          Row(children: [
            BoardTile(
              x: 0,
              y: 0,
              tileState: tileStatesList[6],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(6),
            ),
            BoardTile(
              x: 1,
              y: 0,
              tileState: tileStatesList[7],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(7),
            ),
            BoardTile(
              x: 2,
              y: 0,
              tileState: tileStatesList[8],
              tileDim: tileDim,
              boardNum: boardNum,
              onPress: () => updateTile(8),
            ),
          ])
        ]),
      );
    });
  }
}

//