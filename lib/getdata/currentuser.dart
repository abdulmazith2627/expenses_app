
import 'package:expenses_app/backend/localdatabse.dart';
import 'package:expenses_app/backend/users.dart';
import 'package:get/get.dart';


class Currentuser extends GetxController{
  final Rx<Users> _currentuser=Users(
     userid:0,
     profile: null, 
     email: '', 
     username: '',
      password: '').obs;
    

     Users get data=>_currentuser.value;

     getuserdatas()async{
      Users? getuserdataformlocaldatabase=await UsersPreferences.getuserdata() ;
      _currentuser.value=getuserdataformlocaldatabase!;
     }



}
 
