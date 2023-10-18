import 'package:flutter/material.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
