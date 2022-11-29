import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/tile_widget.dart';
import 'package:ultimate_tic_tac_toe/pages/app_settings.dart';
import '../main_board.dart';

class SubBoardWidget extends StatefulWidget {
  final SubBoard _subBoard;
  final double _boardSizePixels;
  final Function _notifyBoard;
  final bool _highlighting;
  const SubBoardWidget({
    Key? key,
    required SubBoard subBoard,
    required double boardSizePixels,
    required Function notifyBoard,
    bool highlighting = true,
  })  : _subBoard = subBoard,
        _boardSizePixels = boardSizePixels,
        _notifyBoard = notifyBoard,
        _highlighting = highlighting,
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
      final boardDim = widget._boardSizePixels;
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
          height: widget._boardSizePixels, width: widget._boardSizePixels);

      return Stack(
        alignment: Alignment.center,
        children: [w, img, highlighting(widget), gv],
      );
    });
  }

  Widget symbolForTile(TileState winner, SubBoardWidget subBoardWidget) {
    Widget widget;

    String stringKeySBW = subBoardWidget.key.toString();
    String xIcon = AppSettingState.currentXIcon;
    String oIcon = AppSettingState.currentOIcon;

    switch (winner) {
      case TileState.none:
        widget = Container(key: Key("$stringKeySBW Empty Tile"));
        break;

      case TileState.O:
        widget = Image.asset(oIcon,
            key: Key("$stringKeySBW O Tile"),
            height: subBoardWidget._boardSizePixels,
            width: subBoardWidget._boardSizePixels);
        break;

      case TileState.X:
        widget = Image.asset(xIcon,
            key: Key("$stringKeySBW X Tile"),
            height: subBoardWidget._boardSizePixels,
            width: subBoardWidget._boardSizePixels);
        break;
    }
    return widget;
  }

  Opacity highlighting(SubBoardWidget sbw) {
    SubBoard? sb = sbw._subBoard.getBoard().getCurrentSubboard();

    double opacityVal;
    if (sb == sbw._subBoard && sbw._highlighting) {
      opacityVal = 0.5;
    } else {
      opacityVal = 0;
    }

    MainBoard mb = widget._subBoard.getBoard();
    Color c;

    if (mb.getTurn() == TileState.X) {
      c = const Color.fromARGB(255, 119, 183, 236);
    } else {
      c = const Color.fromARGB(255, 236, 119, 119);
    }

    return Opacity(
        opacity: opacityVal,
        child: SizedBox.square(
            dimension: sbw._boardSizePixels,
            child: DecoratedBox(
                decoration: BoxDecoration(
              color: c,
            ))));
  }
}
