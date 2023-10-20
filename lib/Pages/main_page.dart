import 'package:flutter/material.dart';
import 'package:memorydirective/Pages/Notes/screens_notes/Notehome.dart';


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

                    Container(child:  MaterialButton(
                        child: const Text('TO DO',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 30.0,
                          color: Colors.white,
                        ),),
                        onPressed: (){}

                    ),
                      height: 220,
                      width: 200.0,

                      color: Colors.black,
                    ),
                    Container(
                      child: MaterialButton(
                        child: Text('N O T E S',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 30.0,
                          color: Colors.black,
                        ),),
                        onPressed: (){}

                      )
                      ,height: 220,
                      width: 200.0,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      child: MaterialButton(
                        child: Text('M E M O R Y D I A R Y',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 30.0,
                          color: Colors.black,
                        ),),
                        onPressed: (){}

                    )
                      ,height: 220,
                      width: 400.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(child: MaterialButton(
                        child: Text('R E M A I N D E R ',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 19.0,
                          color: Colors.black,
                        ),),
                        onPressed: (){}

                    )
                      ,
                      height: 220,
                      width: 200.0,
                      color: Colors.white,
                    ),
                    Container(child: MaterialButton(
                        child: Text('R E M A I N D E R ',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 19.0,
                          color: Colors.black,
                        ),),
                        onPressed: (){}

                    )
                      ,
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
