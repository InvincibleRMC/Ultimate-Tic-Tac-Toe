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
  static  String _test = "test";
  static const List<String> _iconList = ['Classic', 'Pets'];
  static const String _iconStart = 'Classic';
  String _iconDropDown = _iconStart;

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
                    Image.asset('images/x.png'),
                  ],
                ),
                Column(
                  children:
                  [
                    Image.asset('images/o.png'),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  key: const Key("test_button"),
                  onPressed: () {
                    //TODO
                  },
                  child: Text(_test),
                ),
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
