

import 'package:expenses_app/mainpage/addexpenses.dart';
import 'package:expenses_app/mainpage/homepage.dart';
import 'package:expenses_app/mainpage/profile.dart';
import 'package:flutter/material.dart';

class OnBar extends StatefulWidget {
  const OnBar({super.key});

  @override
  State<OnBar> createState() => _OnBarState();
}

class _OnBarState extends State<OnBar> {
   
  int indexbar = 0;
  List<Widget> pages = [
    const Homepage(),
    const Addexpenses(),
    const Profilepage(),
 

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:const Color(0xff6D57D0),
        unselectedItemColor:Colors.white,
        selectedItemColor:Colors.white,
          currentIndex: indexbar,
          onTap: (value) {
            setState(() {
              indexbar = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              label: "aadd",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "account",
            ),
          ]),
          body:pages[indexbar],
    ); 
  }
}