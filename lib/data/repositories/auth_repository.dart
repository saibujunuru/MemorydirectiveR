import 'package:firebase_auth/firebase_auth.dart';
import 'package:memorydirective/data/data.dart';

abstract class AuthRepository {
  Future<bool> googleSignIn();
  Future<void> signOut();
  Stream<User?> authStateChanges();
  Stream<AppUser?> getCurrentUser();
}