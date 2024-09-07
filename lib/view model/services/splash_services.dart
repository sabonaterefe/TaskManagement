import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/res/routes/routes.dart';

class SplashServices{
  static void checkLogin()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? uid=pref.getString('TOKEN');
    Timer(const Duration(milliseconds: 2000), () {
      if(uid==null){
        Get.toNamed(Routes.signUpScreen);
      }else{
        Get.toNamed(Routes.homePage);
      }
    });

  }
}
