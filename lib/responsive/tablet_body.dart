import 'package:flutter/material.dart';
import 'package:memorydirective/constant_page.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);



  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}


class _TabletScaffoldState extends State<TabletScaffold> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index){
    setState(){
      _selectedIndex = index;
    }
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
    const Center(
      child:  Text(
        'Connect Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: const Text(
        'Master Page',
        style:  TextStyle(fontSize: 50),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: _Pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home),label : 'Cryome'),
          BottomNavigationBarItem(icon: const Icon(Icons.home),label : 'Mem'),
          BottomNavigationBarItem(icon: const Icon(Icons.home),label : 'Home'),
          BottomNavigationBarItem(icon: const Icon(Icons.home),label : 'connect'),
          BottomNavigationBarItem(icon: const Icon(Icons.home),label : 'Master')
        ],

      ),
    );
  }
}
