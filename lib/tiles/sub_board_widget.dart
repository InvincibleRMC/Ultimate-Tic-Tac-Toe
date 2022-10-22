import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_widget.dart';

class SubBoardWidget extends StatefulWidget {
  final SubBoard _subBoard;
  final double _boardWidthPixels;
  final double _boardHeightPixels;

  @override
  State<SubBoardWidget> createState() => SubBoardState();

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
}

@visibleForTesting
class SubBoardState extends State<SubBoardWidget> {
  List<TileState> _tileStatesList = List.filled(9, TileState.none);
  // TODO move higher
  TileState _turn = TileState.X;

  TileState getTileState() {
    return _turn;
  }

  List<TileState> getListTileState() {
    return _tileStatesList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/board.png',
            height: widget._boardHeightPixels, width: widget._boardWidthPixels),
        Container(
            //So X and Os line up
            //TODO
            // Could maybe be done better
            padding: EdgeInsets.symmetric(
              vertical: 70.0,
            ),
            child: subBoardTiles(widget._subBoard)),
      ],
    );
  }

  Widget subBoardTiles(SubBoard subBoard) {
    return Builder(builder: (context) {
      final int boardCount = subBoard.getBoard().size();
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
              tile: subBoard.getTile(i, j),
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
