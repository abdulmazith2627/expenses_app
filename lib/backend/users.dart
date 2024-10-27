import 'dart:convert';
import 'dart:typed_data';


class Users {
  int  userid;
  Uint8List? profile;
  String email;
  String username;
  String password;
 

   Users(
    {
      required this.userid,
      required this.profile,
      required this.email,
      required this.username,
      required this.password,
      
    }
   );



   Map<String,dynamic> toJson()=>{
     'id':userid,
     'profile': base64Encode(profile!),
     'email':email,
     'username':username,
     'password':password
   };

  factory Users.fromJson(Map<String,dynamic> json)=>Users(
 
  email:json['email'] ?? '', 
  username: json['username']?? '', 
  password: json['password'] ?? '', 
  profile: base64Decode(json['profile']), 
  userid: int.parse(json['id'].toString()),
  );
  
}