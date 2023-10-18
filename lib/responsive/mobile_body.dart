import 'package:flutter/material.dart';
import 'package:memorydirective/constant_page.dart';
import 'package:memorydirective/Pages/main_page.dart';
import 'package:memorydirective/Pages/mem_page.dart';
import 'package:memorydirective/Pages/connect_page.dart';
import 'package:memorydirective/Pages/master_page.dart';
import 'package:memorydirective/Pages/cryome_page.dart';
class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  final List<Widget> _Pages = [
    CryomePage(),
    MemPage(),
    MainPage(),
    ConnectPage(),
    MasterPage(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: _Pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black87,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.white,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [


        BottomNavigationBarItem(icon: Icon(Icons.camera),label : 'Cryome',),
    BottomNavigationBarItem(icon: Icon(Icons.memory),label : 'Mem'),
    BottomNavigationBarItem(icon: Icon(Icons.home),label : 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.chat),label : 'connect'),
    BottomNavigationBarItem(icon: Icon(Icons.school),label : 'Master')
    ],
    ),
    );
  }
}
