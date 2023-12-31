import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:memorydirective/data/model/app_user.dart';

class AuthService{
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AuthService(this._auth,this. _firestore);

  Future<bool> googleSignIn() async{
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final signInAccount = await googleSignIn.signIn();
    if(signInAccount == null) return false;
    final googleAuth = await signInAccount.authentication;
    final oauthCredntials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken

    );
    try {
      final result = await _auth.signInWithCredential(oauthCredntials);
      final user = result.user;

      await _firestore.collection('users').doc(user?.uid).set({
        'username': user?.displayName,
        'email': user?.email,
        'userId': user?.uid,
        'imgUrl': user?.photoURL
      });
      return true;
    }
    catch(e){
      debugPrint(e.toString());
      return false;
    }


  }
  Future<void> signOut() async
  {
    await Future.wait([
      _auth.signOut(),
      GoogleSignIn().signOut(),


    ]);

  }

  Stream<User?> authStateChanges() async* {
    yield* _auth.authStateChanges();
  }
  Stream<QuerySnapshot<Object?>> getCurrentUser() async*{
    await _auth.currentUser?.reload();
    final currentUser = _auth.currentUser;
    if (currentUser != null){
      yield* _firestore
          .collection('users')
          .where('userid' , isEqualTo: currentUser.uid)
          .limit(1)
          .snapshots();
    }
  }


  }

// abstract class AuthRepositary{
//   Future<bool> googleSignIn();
//   Future<void> signOut();
//   Stream<User?> authStateChanges();
//   Stream<AppUser> getCurrentUser();
//
//
// }



