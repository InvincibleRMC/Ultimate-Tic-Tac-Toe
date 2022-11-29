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
  static const String _iconStart = 'Classic';
  String _iconDropDown = _iconStart;
  static String _currentXIcon = 'images/x.png';
  static String _currentOIcon = 'images/o.png';

  static String getCurrentXIcon() {
    return _currentXIcon;
  }

  static String getCurrentOIcon() {
    return _currentOIcon;
  }

  @visibleForTesting
  void changeIcon(String icon) {
    _iconDropDown = icon;
    _changeIcon();
  }

  void _changeIcon() {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width / 5;

    return Scaffold(
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
                key: const Key("drop_down_button"),
                value: _iconDropDown,
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
