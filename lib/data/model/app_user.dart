import 'dart:convert';
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String userId;
  final String username;
  final String email;
  final String imgUrl;
  const AppUser({
    required this.userId,
    required this.imgUrl,
    required this.username,
    required this.email,

  });
  @override
  List<Object> get props => [userId,username,email,imgUrl];
  Map<String,dynamic> toMap(){
    return <String , dynamic>{
      'userId' : userId,
      'username': username,
      'email':email,
     ' imgUrl':imgUrl,
    };


  }
  factory AppUser.fromMap(Map<String,dynamic>map){
    return AppUser(
        userId: map['userId'] as String,
        username: map['username'] as String,
        imgUrl: map['imgUrl'] as String,
        email: map['email'] as String);
  }
  String toJson() => json.encode(toMap());
  factory AppUser.fromJson(String source) =>AppUser.fromMap(jsonDecode(source) as Map<String,dynamic>);
}