import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
          body: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                 children :[

                    Container(
                      height: 220,
                      width: 200.0,

                      color: Colors.black,
                    ),
                    Container(
                      height: 220,
                      width: 200.0,
                      color: Colors.black45,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      height: 220,
                      width: 400.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      height: 220,
                      width: 200.0,
                      color: Colors.black45,
                    ),
                    Container(
                      height: 220,
                      width: 200.0,
                      color: Colors.black,
                    ),
                  ],
                )




              ],
            )
          ),
      ),
    );
  }
}
