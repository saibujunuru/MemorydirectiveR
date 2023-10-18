import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memorydirective/components_login//my_button.dart';
import 'package:memorydirective/components_login//my_textfield.dart';
import 'package:memorydirective/components_login//square_tile.dart';
import 'package:memorydirective/pages_login/forget_Passwordpage.dart';
import 'package:memorydirective/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key,required this.onTap});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      if(e.code == "user-not-found") {
        wrongUserMessage();
      }else if(e.code == "wrong-password")
        {
         wrongPasswordMessage();

      }
    }
  }
  void wrongUserMessage()
  {
    showDialog(context: context, builder:(context){
      return const AlertDialog(
        title: Text('Incorrect Email'),
      );

    },
    );
  }
  void wrongPasswordMessage()
  {
    showDialog(context: context, builder:(context){
      return const AlertDialog(
        title: Text('Incorrect Password'),
      );

    },
    );
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
                const SizedBox(width: 40),

                // logo
               const Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                   Icon(
                    Icons.lock,
                    
                    size: 90,
                  ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 15),

                      child: Text('M E M D I',style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w400

                      ),),
                    )
  ],
                ),

                const SizedBox(height: 20),

                // welcome back, you've been missed!
                Text(
                  'Lets create a account for you!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 35),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email id ',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return ForgetPasswordPage();
                  }
                  ),
                        );

                  },
                      child: Text(
                         'Forget password?',
                      style: TextStyle
                      (
                       color: Colors.black,
                     fontWeight: FontWeight.bold,

                   ),
                   ),
                  ),
                  ],
                         ),
                      ),
                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text :"Sign In",
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    // google button
                    SquareTile(
                      onTap: ()=> AuthService().signInWithGoogle(),
                        imagePath: 'assets/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(
                        onTap: (){},
                        imagePath: 'assets/images/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                     GestureDetector(
                       onTap: widget.onTap,
                      child: const Text('Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
