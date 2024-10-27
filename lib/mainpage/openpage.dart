import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Openpage extends StatefulWidget {
  const Openpage({super.key});

  @override
  State<Openpage> createState() => _OpenpageState();
}

class _OpenpageState extends State<Openpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff6D57D0),
      appBar:AppBar(),
      body:Container(
        width:MediaQuery.of(context).size.width,
        height:500,
        child: Center(
          child: Container(
            
            color:Colors.white,
            child:Column(
              mainAxisAlignment:MainAxisAlignment.center,
            children: [
               Get.arguments['image']!=null?Container(
                  width:200,
                  height:200,
                  decoration:BoxDecoration(
                    color:const Color(0xff6D57D0),
                    borderRadius:BorderRadius.circular(10),
                    image:DecorationImage(image:MemoryImage(Get.arguments['image']))
                  ),
                 ):  Container(
                  
                  decoration:BoxDecoration(
                    color:const Color(0xff6D57D0),
                    borderRadius:BorderRadius.circular(10),
                 
                  ),
                 ),
          
                const  SizedBox(
                  height:20,
                 ),
          
                 Text("Date : ${Get.arguments['date']??"null"}"),
          
                  const  SizedBox(
                  height:20,
                 ),
          
                 Text("Productname :${Get.arguments['product']??"null"}"),
                   const  SizedBox(
                  height:20,
                 ),
          
                 Text("Price :${Get.arguments['price']??"null"} "),
          
                   const  SizedBox(
                  height:20,
                 ),
          
                 Text("shop name :${Get.arguments['shopname']??"null"} "),
            ],
          ),
          ),
        ),
      )
    );
  }
}