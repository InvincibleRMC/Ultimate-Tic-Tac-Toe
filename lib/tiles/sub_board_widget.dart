import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_widget.dart';

class SubBoardWidget extends StatefulWidget {
  final SubBoard _subBoard;
  final double _boardWidthPixels;
  final double _boardHeightPixels;
  final Function _notifyBoard;

  //TODO make a square not rectangle?
  const SubBoardWidget({
    Key? key,
    required SubBoard subBoard,
    required double boardWidthPixels,
    required double boardHeightPixels,
    required Function notifyBoard,
  })  : _subBoard = subBoard,
        _boardWidthPixels = boardWidthPixels,
        _boardHeightPixels = boardHeightPixels,
        _notifyBoard = notifyBoard,
        super(key: key);

  double getBoardWidthPixels() {
    return _boardWidthPixels;
  }

  double getBoardHeightPixels() {
    return _boardHeightPixels;
  }

  @override
  State<StatefulWidget> createState() => SubBoardWidgetState();
}

class SubBoardWidgetState extends State<SubBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return subBoardTiles();
  }

  void subBoardRefresh(BuildContext context, SubBoard s) {
    setState(() {
      widget._notifyBoard(context, s.getBoard());
    });
  }

  Widget subBoardTiles() {
    return Builder(builder: (context) {
      final int boardCount = widget._subBoard.getBoard().size();
      final boardDim = MediaQuery.of(context).size.width / boardCount;
      final tileDim = boardDim / boardCount;

      final children = <Widget>[];

      for (int i = 0; i < boardCount; i++) {
        final childrenRow = <Widget>[];
        for (int j = 0; j < boardCount; j++) {
          childrenRow.add(
            TileWidget(
              tileDim: tileDim,
              tile: widget._subBoard.getTile(i, j),
              notifySubBoard: subBoardRefresh,
            ),
          );
        }
        children.add(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: childrenRow));
      }

      // final stack = Stack();
      Widget w = symbolForTile(widget._subBoard.getWinner(), widget);

      Column col = Column(
          mainAxisAlignment: MainAxisAlignment.center, children: children);

      Image img = Image.asset('images/board.png',
          height: widget._boardHeightPixels, width: widget._boardWidthPixels);

      return Stack(
        alignment: Alignment.center,
        children: [w, img, col],
      );
    });
  }

  Widget symbolForTile(TileState winner, SubBoardWidget subBoardWidget) {
    Widget widget;

    switch (winner) {
      case TileState.none:
        widget = Container(key: const Key("Empty Tile"));
        break;

      case TileState.O:
        widget = Image.asset('images/o.png',
            key: const Key("O Tile"),
            height: subBoardWidget._boardHeightPixels,
            width: subBoardWidget._boardWidthPixels);
        break;

      case TileState.X:
        widget = Image.asset('images/x.png',
            key: const Key("X Tile"),
            height: subBoardWidget._boardHeightPixels,
            width: subBoardWidget._boardWidthPixels);
        break;
    }
    return widget;
  }
}
