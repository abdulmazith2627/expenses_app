

import 'dart:convert';
import 'dart:typed_data';
import 'package:expenses_app/backend/apis.dart';
import 'package:expenses_app/backend/expenses/expensesuser.dart';
import 'package:expenses_app/backend/localdatabse.dart';
import 'package:expenses_app/getdata/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expenses_app/backend/users.dart';

class Register extends GetxController{



// signup 

Future<String> signup(
  {
  required Uint8List profile,
  required  String email,
  required  String password,
  required  String username,
  }
)async{
  String res="error";
  try {
     Users users =Users(
      profile: profile, 
      email: email, 
      username: username, 
      password: password, 
      userid:0
      );

   final getdata=await http.post(
    Uri.parse(Apis.signupapi),
    headers:{
       'Content-Type': 'application/json',
    },
    body:jsonEncode(users)
    );
   
  if (getdata.statusCode == 200) {
  print(jsonDecode(getdata.body)); // Attempt to decode JSON only on success
} else {
  print("Error: ${getdata.statusCode}");
  print("Response: ${getdata.body}");
}





  } catch (e) {
    print("Error signup : $e");
  }




  return res;
}


// login : 


Future login( 
  {
  required  String email,
  required  String password,
  } 
  )async{
      
  try {

  Map<String, dynamic> usersdata = {
    'email': email,
    'password': password,
  };
     final getdata=await http.post(
      Uri.parse(Apis.loginapi),
      headers:{
         'Content-Type': 'application/json',
      },
      body:jsonEncode(usersdata)
      );
       
       if(getdata.statusCode==200){
        final res=jsonDecode(getdata.body);

           await UsersPreferences.saveuserdata(res['php_userdata']);
           Get.offAllNamed('/barpage');
          
       }

        
          
       } catch (e) {
        print( "login: ${e.toString()}");
         
       }
    
}

 

}



class Expensesdata extends GetxController{

Future expenses(
  {
  required Uint8List image,
  required String name,
  required String productname,
  required int price,
  required String shopname,
  required int userid,

  }
)async{
  try {
     Expensesuser expenses =Expensesuser(
      image: image, 
      name: name, 
      productname: productname,
       price: price, 
       shopname: shopname,
      userid: userid
        );

         final getdata = await http.post(Uri.parse(Apis.expensesapi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(expenses)
        );

        if (getdata.statusCode==200) {
          print(jsonDecode(getdata.body));
        }


  } catch (e) {
    print("expenses : $e");
  }
}






 List data=[].obs;
Future getProductdata(
  {required int id}
)async{

 try {
   Map<String,dynamic>adminid={'usersid':id};
   print("user Id : ${adminid.toString()}");

    final getdata=await http.post(
      Uri.parse(Apis.getexpensesapi),
       headers: {'Content-Type': 'application/json',},
       body:jsonEncode(adminid)
      );
     var getproductdata=jsonDecode(getdata.body);
     print(getproductdata['productdata'].toString());
      List products = getproductdata['productdata'];
       data= products.map((product) => Expensesuser.fromJson(product)).toList();
      print(data.toList().toString());
      print(data.length);
 } catch (e) {
   print("Flutter Exception : ${e.toString()}");
 }
   update();
     return data;
     
     
}


}