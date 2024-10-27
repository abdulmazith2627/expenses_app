import 'dart:typed_data';

import 'package:expenses_app/backend/fetchdata.dart';
import 'package:expenses_app/imagepick/picker.dart';
import 'package:expenses_app/widget/form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
    final TextEditingController _email=TextEditingController();
    final TextEditingController _password=TextEditingController();
    final TextEditingController _username=TextEditingController();
    Uint8List? _imageBytes;
    final register=Get.put(Register());


   Future<void> seleimage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _imageBytes = result.files.first.bytes;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
     
    }
  }

     void getdata(){
      register.signup(
        profile:_imageBytes!, 
        email:_email.text, 
        password:_password.text, 
        username:_username.text
        );
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
                height:244,
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
                      Text("Create a new \n account", 
                              style:GoogleFonts.inter(color:Colors.white,fontSize:35,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold), 
                              ),
                              Text("sign up and enjoy", 
                              style:GoogleFonts.inter(color:const Color.fromARGB(115, 255, 255, 255),fontSize:20,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold), 
                              ),
                  
                    ],
                  ),
                ),
              ),
          
          
        
          
          
          
            Padding(
              padding:const EdgeInsets.all(20),
              child:Column(
                children: [

                  InkWell(
                    onTap:(){seleimage();},
                    child: _imageBytes!=null?CircleAvatar(
                      radius:40,
                      backgroundImage:MemoryImage(_imageBytes!),
                    ):const CircleAvatar(
                      radius:40,
                      child:Icon(Icons.add_photo_alternate),
                    ),
                  ),

                    const SizedBox(height:20,),
             TextForm(lable: 'email@gmail.com', controller:_email, ispass:false,),
             const SizedBox(height:20,),
             TextForm(lable: '@username', controller:_username, ispass:false,),
            const SizedBox(height:20,),
             TextForm(lable: 'password12345', controller:_password, ispass:true,),
             const SizedBox(height:20,),
             ElevatedButton(
              onPressed:(){
                
                  getdata();
                  _email.clear();
                  _password.clear();
                  _username.clear();
                  setState(() {
                    _imageBytes=null;
                  });
                  
              
              },
               child:Text("Sign up",style:GoogleFonts.inter(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,color:Colors.white),))
                ],
              ),
              ),
              
          
           Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
          Text("Already have account",style:GoogleFonts.inter(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic)),
              TextButton(
                onPressed:(){Get.back();}, 
                child:Text("login!",style:GoogleFonts.inter(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,color:const Color(0xff6D57D0)))
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