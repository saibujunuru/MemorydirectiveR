import 'package:flutter/material.dart';
import 'package:memorydirective/Pages/pages_travel//travel_page.dart';


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
        body :TravelPage()),

    );
  }
}
