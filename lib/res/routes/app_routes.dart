import 'package:get/get.dart';
import 'package:task_manager/res/routes/routes.dart';
import 'package:task_manager/view/home%20page/home_page.dart';
import 'package:task_manager/view/sign%20in/sign_in.dart';
import 'package:task_manager/view/sign%20up/sign_up.dart';
import 'package:task_manager/view/splash/splash_screen.dart';

class AppRoutes{
  static List<GetPage> routes(){
    return [
      GetPage(name: Routes.splashScreen, page: ()=>const SplashScreen()),
      GetPage(name: Routes.signUpScreen, page: ()=>const SignUp()),
      GetPage(name: Routes.signInScreen, page: ()=>const SignIn()),
      GetPage(name: Routes.homePage, page: ()=> HomePage()),
    ];
  }
}
