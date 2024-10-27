import 'dart:typed_data';

import 'package:expenses_app/backend/fetchdata.dart';
import 'package:expenses_app/getdata/currentuser.dart';
import 'package:expenses_app/widget/form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Addexpenses extends StatefulWidget {
  const Addexpenses({super.key});

  @override
  State<Addexpenses> createState() => _AddexpensesState();
}

class _AddexpensesState extends State<Addexpenses> {
    final TextEditingController _name=TextEditingController();
    final TextEditingController _productname=TextEditingController();
    final TextEditingController _price=TextEditingController();
    final TextEditingController _shopname=TextEditingController();
    Uint8List? _imageBytes;
    final expenses=Get.put(Expensesdata());
    final user=Get.put(Currentuser());
     
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
  
     getdata(){
     expenses.expenses(
      image:_imageBytes!,
       name:_name.text, 
       productname:_productname.text,
        price:int.parse(_price.text),
        shopname:_shopname.text, 
        userid:user.data.userid
        );
        print("getdata : ${user.data.userid??"no data"}");
        print("getdata : ${user.data.email??"no data"}");
     }
 
    @override
  void dispose() {
   _name.dispose();
   _productname.dispose();
   _price.dispose();
   _shopname.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
               const SizedBox(height:30,),
                GestureDetector(
                  onTap:(){seleimage();},
                  child:_imageBytes!=null?Container(
                    width:300,
                    height:200,
                   
                    decoration:BoxDecoration(
                      image:DecorationImage(
                        image:MemoryImage(_imageBytes!),
                        filterQuality:FilterQuality.high,
                        fit:BoxFit.fill
                        ),
                      color:const Color(0xff6D57D0),
                      borderRadius:BorderRadius.circular(10)
                    ),
                    
                  ): Container(
                    width:300,
                    height:200,
                   
                    decoration:BoxDecoration(
                    
                       color:const Color(0xff6D57D0),
                      borderRadius:BorderRadius.circular(10)
                    ),
                    child:const Center(child:Text("Select the product image",style:TextStyle(color:Colors.white),),),
                  ),
                ),
               const SizedBox(height:50,),
                   
                    TextForm(lable: 'enter the your name', controller:_name, ispass:false,),
                     const SizedBox(height:20,),
                      TextForm(lable: 'enter the product name', controller:_productname, ispass:false,),
                      const SizedBox(height:20,),
                        TextForm(lable: 'enter the product price', controller:_price, ispass:false,),
                        const SizedBox(height:20,),
                          TextForm(lable: 'enter the shop name', controller:_shopname, ispass:false,),
                          const SizedBox(height:20,),
                           ElevatedButton(
                onPressed:(){            
                        getdata();

                        _name.clear();
                        _price.clear();
                        _productname.clear();
                        _shopname.clear();
                        setState(() {
                         _imageBytes=null;
                        });
                  },
                 child:Text("Add Expenses",style:GoogleFonts.inter(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,color:Colors.white),))
               
              ],
            ),
          ),
        )
        ),
    );
  }
}