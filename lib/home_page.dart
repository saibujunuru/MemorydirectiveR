import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memorydirective/responsive/desktop_body.dart';
import 'package:memorydirective/responsive/tablet_body.dart';
import 'responsive/mobile_body.dart';
import 'responsive/responsive_layout.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;
 void signUserOut(){
   FirebaseAuth.instance.signOut();

}

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: ResponsiveLayout(
        mobileBody: const MobileScaffold(),
        tabletBody: const TabletScaffold(),
        desktopBody: const DesktopScaffold(),
      ),
    );


  }
}
