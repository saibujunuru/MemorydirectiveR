import 'package:flutter/material.dart';


class MemPage extends StatefulWidget {
  const MemPage({super.key});

  @override
  State<MemPage> createState() => _MemPageState();
}

class _MemPageState extends State<MemPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
