import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/tile_widget.dart';

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

  @override
  State<StatefulWidget> createState() => SubBoardWidgetState();
}

class SubBoardWidgetState extends State<SubBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: subBoardTiles());
  }

  void _subBoardRefresh(BuildContext context, SubBoard s) {
    setState(() {
      widget._notifyBoard(context, s.getBoard());
    });
  }

  Widget subBoardTiles() {
    return Builder(builder: (context) {
      final int boardCount = widget._subBoard.getBoard().size();
      final boardDim = widget._boardWidthPixels;
      final tileDim = boardDim / boardCount;

      final children = <Widget>[];

      for (int i = 0; i < boardCount; i++) {
        for (int j = 0; j < boardCount; j++) {
          children.add(
            TileWidget(
              tileDim: tileDim,
              tile: widget._subBoard.getTile(i, j),
              notifySubBoard: _subBoardRefresh,
            ),
          );
        }
      }

      GridView gv = GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        shrinkWrap: true,
        children: children,
      );

      Widget w = symbolForTile(widget._subBoard.getWinner(), widget);

      Image img = Image.asset('images/board.png',
          height: widget._boardHeightPixels, width: widget._boardWidthPixels);

      return Stack(
        alignment: Alignment.center,
        children: [w, img, gv],
      );
    });
  }

  Widget symbolForTile(TileState winner, SubBoardWidget subBoardWidget) {
    Widget widget;

    String stringKeySBW = subBoardWidget.key.toString();

    switch (winner) {
      case TileState.none:
        widget = Container(key: Key("$stringKeySBW Empty Tile"));
        break;

      case TileState.O:
        widget = Image.asset('images/o.png',
            key: Key("$stringKeySBW O Tile"),
            height: subBoardWidget._boardHeightPixels,
            width: subBoardWidget._boardWidthPixels);
        break;

      case TileState.X:
        widget = Image.asset('images/x.png',
            key: Key("$stringKeySBW X Tile"),
            height: subBoardWidget._boardHeightPixels,
            width: subBoardWidget._boardWidthPixels);
        break;
    }
    return widget;
  }
}
