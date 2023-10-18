import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memorydirective/components_login//my_button.dart';
import 'package:memorydirective/components_login//my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key,required this.onTap});



  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // sign user in method
  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    );
    try{
    if(passwordController.text == confirmpasswordController.text){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:emailController.text ,
        password:  passwordController.text,
    );
    addUserDetails(
      nameController.text.trim(),
      ageController.text.trim(),
      int.parse(emailController.text.trim()),
    );

    }
    else{
      showErrorMessage("password and confirm password didn't match");
    }
    Navigator.pop(context);
    }on FirebaseAuthException catch (e){
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }
  Future addUserDetails(
      String name ,String email ,int age
      ) async{
    await FirebaseFirestore.instance.collection('Users').add({
      'name': name,
      'age': age,
      'email':email,

    });
  }
  void showErrorMessage(String message){
    showDialog(context: context, builder:(context){
      return AlertDialog(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
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
                const SizedBox(height: 50),

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
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 15),




                MyTextField(
                  controller: nameController,
                  hintText: 'name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                MyTextField(
                  controller: ageController,
                  hintText: 'age',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                MyTextField(
                  controller: emailController,
                  hintText: 'email',
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
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 40),

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


                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap:widget.onTap,
                      child: const Text('Login now',
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

