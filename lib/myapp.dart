import 'package:expenses_app/auth/login.dart';
import 'package:expenses_app/auth/signup.dart';
import 'package:expenses_app/backend/fetchdata.dart';
import 'package:expenses_app/backend/localdatabse.dart';
import 'package:expenses_app/backend/users.dart';
import 'package:expenses_app/connectionpage/page.dart';
import 'package:expenses_app/getdata/currentuser.dart';
import 'package:expenses_app/mainpage/addexpenses.dart';
import 'package:expenses_app/mainpage/homepage.dart';
import 'package:expenses_app/mainpage/openpage.dart';
import 'package:expenses_app/mainpage/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  
  final currentuser=Get.put(Currentuser());
  final gatuser=Get.put(Expensesdata());


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Expenses App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff6D57D0),
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: const Size(250, 40),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:FutureBuilder(
        future: UsersPreferences.getuserdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasError) {
            return const Scaffold(body: Center(child: Text("Error")));
          }
          if (snapshot.hasData) {
           
           return const OnBar();
          }
          return const Loginpage();
        },
      ),
      

      getPages: [
        GetPage(name: '/signup', page: () => const Signup()),
        GetPage(name: '/login', page: () => const Loginpage()),
        GetPage(name: '/homepage', page: () => const Homepage()),
        GetPage(name: '/barpage', page: () => const OnBar()),
        GetPage(name: '/openpage', page: () => const Openpage()),
      ],
    );
  }
}


// FutureBuilder(
//         future: UsersPreferences.getuserdata(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Scaffold(body: Center(child: CircularProgressIndicator()));
//           }
//           if (snapshot.hasError) {
//             return const Scaffold(body: Center(child: Text("Error")));
//           }
//           if (snapshot.hasData) {
           
//            return const OnBar();
//           }
//           return const Loginpage();
//         },
//       ),