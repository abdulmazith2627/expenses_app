import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextForm extends StatelessWidget {
  const TextForm({super.key,required this.lable,required this.controller,required this.ispass});
final String lable;
final TextEditingController controller;
final 
bool ispass;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
              obscureText: ispass,
              controller:controller,
              decoration: InputDecoration(
                contentPadding:const EdgeInsets.all(15),
                border:const OutlineInputBorder(),
                hintText:lable,
                hintStyle:GoogleFonts.inter(fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),
                labelStyle:const TextStyle(fontSize:15)
              ),
            );
  }
}