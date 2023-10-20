import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memorydirective/Pages/screens_master/nav_screen.dart';


class MasterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'MASTER UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      home: Container(),
    );
  }
}