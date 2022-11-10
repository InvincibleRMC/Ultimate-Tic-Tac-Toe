import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});
  final String _title = "App Settings";
  final String _home = "Return Home";
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
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
