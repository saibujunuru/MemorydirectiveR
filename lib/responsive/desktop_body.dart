import 'package:flutter/material.dart';
import '../constant_page.dart';
class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  final List<Widget> _Pages = [
    Center(
      child: Text(
        'Cryome Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'home Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Mem Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Connect Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Master Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body:_Pages[_selectedIndex],
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
