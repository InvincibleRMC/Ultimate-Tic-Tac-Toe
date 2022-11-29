import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  AppSettingState createState() => AppSettingState();
}

class AppSettingState extends State<AppSettings>
{
  static String _title = "App Settings";
  static String _home = "Return Home";
  static const List<String> _iconList = ['Classic', 'Pets'];
  static const String _iconStart = 'Classic';
  String _iconDropDown = _iconStart;
  static String currentXIcon = 'images/x.png';
  static String currentOIcon = 'images/o.png';

  changeIcon()
  {
    switch(_iconDropDown) {
      case 'Classic':
        currentXIcon = 'images/x.png';
        currentOIcon = 'images/o.png';
        break;
      case 'Pets':
        currentXIcon = 'images/cat.png';
        currentOIcon = 'images/dog.png';
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
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
                Column(
                  children:
                  [
          Image.asset(currentXIcon),
                  ],
                ),
                Column(
                  children:
                  [
                    Image.asset(currentOIcon),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      changeIcon();
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          ],
        ),
      ),
    );
  }
}
