import 'package:expenses_app/getdata/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
   final user=Get.put(Currentuser());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:const Color(0xff6D57D0),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Center(
               child: Container(
                color:Colors.white,
                child:Center(
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      const  SizedBox(height:20,),
                       Obx(()=>user.data.profile!=null?CircleAvatar(radius:40,backgroundImage:MemoryImage(user.data.profile!),)
                       :const CircleAvatar(radius:40,),),
                       const  SizedBox(height:10,),
                       Obx(()=>Text("Email : ${user.data.email}"),),
                    const  SizedBox(height:10,),
                     Obx(()=>Text("username : ${user.data.username}"),),
                   const  SizedBox(height:10,),
                     const Text("Expenses : expenses"),
                       const SizedBox(height:30,),
                  
                       ElevatedButton(
                        onPressed: (){}, 
                        child: const Text("Logout",style:TextStyle(color:Colors.white),)
                        ),
                         const  SizedBox(height:10,),
                    ],
                  ),
                ),
               ),
             ),
           )
        ],
      ),
    );
  }
}