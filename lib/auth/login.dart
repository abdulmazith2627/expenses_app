import 'package:expenses_app/backend/fetchdata.dart';
import 'package:expenses_app/backend/localdatabse.dart';
import 'package:expenses_app/mainpage/homepage.dart';
import 'package:expenses_app/widget/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _email=TextEditingController();
    final TextEditingController _password=TextEditingController();
    final register=Get.put(Register());
    final local=Get.put(UsersPreferences());
   
   void getdata(){
    register.login(email:_email.text, password:_password.text);
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body:SingleChildScrollView(
          child: Column(
            children: [
          
              Container(
                width:MediaQuery.of(context).size.width,
                height:300,
                decoration:const BoxDecoration(
                  image:DecorationImage(
                    image:AssetImage("assets/images/design.png"),
                    fit:BoxFit.fill
                    ),
                    borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text("Sign in to your \n account", 
                              style:GoogleFonts.inter(color:Colors.white,fontSize:35,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold), 
                              ),
                              Text("welcome back here", 
                              style:GoogleFonts.inter(color:const Color.fromARGB(115, 255, 255, 255),fontSize:20,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold), 
                              ),
                  
                    ],
                  ),
                ),
              ),
          
          
            const SizedBox(height:30,),
          
          
          
            Padding(
              padding:const EdgeInsets.all(20),
              child:Column(
                children: [
            TextForm(lable: 'email@gmail.com', controller:_email, ispass:false,),
             const SizedBox(height:20,),
             TextForm(lable: 'password12345', controller:_password, ispass:true,),
              
             const SizedBox(height:40,),
             ElevatedButton(
              onPressed:(){
                getdata();
                _email.clear();
                _password.clear();
                
                UsersPreferences.getuserdata();
              
                },
               child:Text("Login now",style:GoogleFonts.inter(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,color:Colors.white),))
                ],
              ),
              ),
              
          
           Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
          Text("Create a new account",style:GoogleFonts.inter(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic)),
              TextButton(
                onPressed:(){Get.toNamed('/signup');}, 
                child:Text("Signup !",style:GoogleFonts.inter(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,color:const Color(0xff6D57D0)))
                )
            ],
           )
            ],
          
          ),
        ),
      )
      );
  }
}