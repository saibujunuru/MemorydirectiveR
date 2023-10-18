import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
          body: Center(
            child: Text(
              'Master Page',
              style: TextStyle(fontSize: 50),
            ),
          ),
      ),
    );
  }
}
