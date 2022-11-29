import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  AppSettingState createState() => AppSettingState();
}

class AppSettingState extends State<AppSettings> {
  final String _title = "App Settings";
  final String _home = "Return Home";
  static const List<String> _iconList = [
    'Classic',
    'Pets',
    'Sports',
    'Suits',
    'Time'
  ];
  static String _iconStart = 'Classic';
  String _iconDropDown = _iconStart;
  static String _currentXIcon = 'images/x.png';
  static String _currentOIcon = 'images/o.png';

  //Background Board
  static const List<String> _boardList = [
    'Classic',
    'Checkerboard',
    'Outside'
  ];
  static String _boardStart = 'Classic';
  String _boardDropDown = _boardStart;
  static String _currentBoard = 'images/board.png';

  //Color Mode
  static const List<String> _modeList = [
    'Light Mode',
    'Dark Mode'
  ];
  static String _modeStart = 'Light Mode';
  String _modeDropDown = _modeStart;
  static int _currentBackgroundColor = 0xffffffff;
  static int _currentTextColor = 0xff000000;

  static String getCurrentXIcon() {
    return _currentXIcon;
  }

  static String getCurrentOIcon() {
    return _currentOIcon;
  }

  static String getCurrentBoard() {
    return _currentBoard;
  }

  static int getCurrentBackgroundColor() {
    return _currentBackgroundColor;
  }

  static int getCurrentTextColor() {
    return _currentTextColor;
  }

  @visibleForTesting
  void changeIcon(String icon) {
    _iconDropDown = icon;
    _changeIcon();
  }

  void _changeIcon() {
    _iconStart = _iconDropDown;
    switch (_iconDropDown) {
      case 'Classic':
        _currentXIcon = 'images/x.png';
        _currentOIcon = 'images/o.png';
        break;
      case 'Pets':
        _currentXIcon = 'images/dog.png';
        _currentOIcon = 'images/cat.png';
        break;
      case 'Sports':
        _currentXIcon = 'images/football.png';
        _currentOIcon = 'images/soccer.png';
        break;
      case 'Suits':
        _currentXIcon = 'images/hearts.png';
        _currentOIcon = 'images/spades.png';
        break;
      case 'Time':
        _currentXIcon = 'images/sun.png';
        _currentOIcon = 'images/moon.png';
        break;
      default:
        _currentXIcon = 'images/x.png';
        _currentOIcon = 'images/o.png';
        break;
    }
  }

  void _changeBoard() {
    _boardStart = _boardDropDown;
    switch (_boardDropDown) {
      case 'Classic':
        _currentBoard = 'images/board.png';
        break;
      case 'Checkerboard':
        _currentBoard = 'images/checkerboard.png';
        break;
      case 'Outside':
        _currentBoard = 'images/outside.png';
        break;
      default:
        _currentBoard = 'images/board.png';
        break;
    }
  }

  void _changeMode() {
    _modeStart = _modeDropDown;
    switch (_modeDropDown) {
      case 'Light Mode':
        _currentBackgroundColor = 0xffffffff;
        _currentTextColor = 0xff000000;
        break;
      case 'Dark Mode':
        _currentBackgroundColor = 0xff35363a;
        _currentTextColor = 0xffffffff;
        break;
      default:

        break;
    }
    }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width / 5;

    return Scaffold(
      backgroundColor: Color(getCurrentBackgroundColor()),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _title,
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _currentXIcon,
                  key: Key(_currentXIcon),
                  width: size,
                  height: size,
                ),
                Image.asset(
                  _currentOIcon,
                  key: Key(_currentOIcon),
                  width: size,
                  height: size,
                ),
              ],
            ),
            DropdownButton<String>(
                key: const Key("icon_drop_down_button"),
                value: _iconDropDown,
                style: new TextStyle(
                  color: Color(getCurrentTextColor())
                ),
                dropdownColor: Color(getCurrentBackgroundColor()),
                items: _iconList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    key: Key(value),
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _iconDropDown = newValue!;
                  });
                  _changeIcon();
                }),
            Image.asset(
              _currentBoard,
              key: Key(_currentBoard),
              width: size,
              height: size,
            ),
            DropdownButton<String>(
                key: const Key("board_drop_down_button"),
                value: _boardDropDown,
                style: new TextStyle(
                    color: Color(getCurrentTextColor())
                ),
                dropdownColor: Color(getCurrentBackgroundColor()),
                items: _boardList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    key: Key(value),
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _boardDropDown = newValue!;
                  });
                  _changeBoard();
                }),
            DropdownButton<String>(
                key: const Key("mode_drop_down_button"),
                value: _modeDropDown,
                style: new TextStyle(
                    color: Color(getCurrentTextColor())
                ),
                dropdownColor: Color(getCurrentBackgroundColor()),
                items: _modeList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    key: Key(value),
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _modeDropDown = newValue!;
                  });
                  _changeMode();
                }),
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Text(_home),
            ),
          ],
        ),
      ),
    );
  }
}
