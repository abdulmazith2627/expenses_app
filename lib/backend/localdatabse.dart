import 'dart:convert';
import 'package:expenses_app/backend/users.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UsersPreferences extends GetxController {
  static Future<void> saveuserdata(Map<String, dynamic> userinfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userJsonData = jsonEncode(userinfo);
    await preferences.setString("currentUser", userJsonData);
    print("User data saved successfully");
  }

  static Future<Users?> getuserdata() async {
    Users? data;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? getdata = preferences.getString("currentUser");
    if (getdata != null) {
     data =Users.fromJson(jsonDecode(getdata));
     
     print("email : ${data.email.toString()}");
     print("email : ${data.userid.toString()}");
    }
    return data;
  }
}