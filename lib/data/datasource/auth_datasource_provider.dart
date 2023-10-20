import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memorydirective/data/datasource/datasource.dart';

final authDataSourceProvider = Provider<AuthDatasource>((ref){
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  return AuthDatasource(auth,firestore);

});