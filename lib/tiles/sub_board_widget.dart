import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_widget.dart';

class SubBoardWidget extends StatelessWidget {
  final SubBoard _subBoard;
  final double _boardWidthPixels;
  final double _boardHeightPixels;

  //TODO make a square not rectangle?
  const SubBoardWidget({
    Key? key,
    required SubBoard subBoard,
    required double boardWidthPixels,
    required double boardHeightPixels,
  })  : _subBoard = subBoard,
        _boardWidthPixels = boardWidthPixels,
        _boardHeightPixels = boardHeightPixels,
        super(key: key);

  double getBoardWidthPixels() {
    return _boardWidthPixels;
  }

  double getBoardHeightPixels() {
    return _boardHeightPixels;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/board.png',
            height: _boardHeightPixels, width: _boardWidthPixels),
        Container(
            //So X and Os line up
            //TODO
            // Could maybe be done better
            padding: const EdgeInsets.symmetric(
              vertical: 70.0,
            ),
            child: subBoardTiles()),
      ],
    );
  }

  Widget subBoardTiles() {
    return Builder(builder: (context) {
      final int boardCount = _subBoard.getBoard().size();
      final boardDim = MediaQuery.of(context).size.width / boardCount;
      final tileDim = boardDim / boardCount;

      final children = <Widget>[];

      for (int i = 0; i < boardCount; i++) {
        final childrenRow = <Widget>[];
        for (int j = 0; j < boardCount; j++) {
          childrenRow.add(
            TileWidget(
              x: i,
              y: j,
              tileDim: tileDim,
              tile: _subBoard.getTile(i, j),
            ),
          );
        }
        children.add(Row(children: childrenRow));
      }

      return SizedBox(width: boardDim, child: Column(children: children));
    });
  }
}
