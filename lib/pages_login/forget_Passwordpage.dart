import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memorydirective/components_login//my_textfield.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final forgetemailController = TextEditingController();
  @override
  void  dispose(){
    forgetemailController.dispose();
    super.dispose();
  }
  Future  passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgetemailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("password reset link sent"),
            );
          }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Lets us help you to recover your password!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 50),

                // username textfield
                MyTextField(
                  controller: forgetemailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 50),

                // sign in button

                MaterialButton(
                  color: Colors.grey,
                  onPressed: passwordReset,
                  child:  Text("rest password",),
                ),

  ],
    ),
      ),
    ),
      ),
    );
  }
}
