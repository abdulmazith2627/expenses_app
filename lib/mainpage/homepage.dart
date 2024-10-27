import 'package:expenses_app/backend/expenses/expensesuser.dart';
import 'package:expenses_app/backend/fetchdata.dart';
import 'package:expenses_app/getdata/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
 
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user=Get.put(Currentuser());
  final expenses=Get.put(Expensesdata());
  int total=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder<Currentuser>(
      init:user,
      initState:(currentstate){
       user.getuserdatas();
      } ,
      builder:(controler){
        return Obx((){
          return FutureBuilder(
          future:expenses.getProductdata(id:user.data.userid), 
          builder:(context, snapshot){
              if (snapshot.connectionState==ConnectionState.waiting) {
                return const Center(child:CircularProgressIndicator(),);
              }else if(snapshot.hasError){
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              else if(!snapshot.hasData || snapshot.data!.isEmpty){
              return Center(child: Text('No Data Found'));
              }
              total = snapshot.data!.fold(0, (sum, item) => sum + item.price);
              return SingleChildScrollView(
        child:Column(
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height:300,
              decoration:const BoxDecoration(
                color:Color(0xff6D57D0),
                borderRadius:BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20))
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                   const SizedBox(height:20,),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      children: [
                        Obx(()=>user.data.profile!=null?CircleAvatar(radius:20,backgroundImage:MemoryImage(user.data.profile!),)
                       :const CircleAvatar(radius:20,),),
                        const SizedBox(width:5,),
                        Obx(()=>Text(user.data.username,style:GoogleFonts.inter(color:Colors.white,fontSize:20,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),)),
                      ],
                     ),
                   ),
                
                  const  SizedBox(height:20,),
                   Text("Total expenses",style:GoogleFonts.inter(color:Colors.white,fontSize:20,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),),
                   const  SizedBox(height:20,),
                   Text("\$ : ${total.toString()} ",style:GoogleFonts.inter(color:Colors.white,fontSize:30,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),),
                  ],
                ),
              ),
            ),
             const SizedBox(height:20,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Align(
                alignment:Alignment.bottomLeft,
                child: Text("Your Expenses",style:GoogleFonts.inter(color:Colors.black,fontSize:25,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),)),
             ),
             SizedBox(
              child:ListView.separated(
                shrinkWrap:true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount:snapshot.data!.length,
                itemBuilder:(context,index){
                  Expensesuser expensesuser=snapshot.data![index];
                  
                   
                  
                  return  ListTile(
                    onTap:(){
                      Get.toNamed(
                        '/openpage',
                        arguments:{
                          'image':expensesuser.image,
                          'date':expensesuser.name,
                          'shopname':expensesuser.shopname,
                          'product':expensesuser.productname,
                          'price':expensesuser.price
                        }
                        );
                    },
                    title: Text(expensesuser.name??"Null",style:GoogleFonts.inter(color:const Color.fromARGB(103, 0, 0, 0),fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),),
                    subtitle:Text(expensesuser.productname??"null",style:GoogleFonts.inter(color:Colors.black,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),)
                    );
                },
                separatorBuilder:(_,__)=>const Divider(),
                ),
             )
          ],
        ),
       );
          }
          );
        });
      }
      
      ),
    );
  }
}



