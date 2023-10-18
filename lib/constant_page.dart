
import 'package:memorydirective/components_login//my_button.dart';
import 'package:memorydirective/components_login//my_textfield.dart';
import 'package:memorydirective/components_login//square_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memorydirective/util/my_tile.dart';

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Colors.grey[900];
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text('Memory Diary '),
  centerTitle: true,
);
var drawerTextColor = TextStyle(
  color: Colors.black45,
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  elevation: 0,
  child: Column(
    children:[Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: tilePadding,
        ),
        DrawerHeader(
            child: Text(
              'M E M D I',style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold
            ),
            )

        ),
        Padding(

          padding:EdgeInsets.all(25),
          child:  GestureDetector(
            
            onTap:() {print('hi');},
            child: const Text('P R O F I L E               ',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20.0,
              ),
            ),
          ),
        ),

        Padding(

          padding:EdgeInsets.all(25),
          child:  GestureDetector(

            onTap:() {print('hi');},
            child: const Text('A B O U T                  ',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Padding(

          padding:EdgeInsets.all(25),
          child:  GestureDetector(

            onTap:() {print('hi');},
            child: const Text('S E T T I N G S           ',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: tilePadding,
        //   child: ListTile(
        //     leading: Icon(Icons.settings),
        //     title: Text(
        //       'S E T T I N G S',
        //       style: drawerTextColor,
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: tilePadding,
        //   child: ListTile(
        //     leading: Icon(Icons.info),
        //     title: Text(
        //       'A B O U T',
        //       style: drawerTextColor,
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Container(
            padding: EdgeInsets.only(top: 50.0),
            margin: EdgeInsets.only(top: 204.0),
            height: 100.0,
            color: Colors.black,
            child: ListTile(
              leading :Icon(Icons.logout,color: Colors.white,),
              title :Text('L O G O U T',style: TextStyle(
                color: Colors.white
              ),),
              onTap: FirebaseAuth.instance.signOut,

            ),
          ),
        ),
      ],
    ),
      Container(

        color: Colors.black,
        height:70.0,

      ),
    ],
  ),
);


class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text('hoe'),
      ),
    );
  }
}

