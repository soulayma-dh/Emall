import 'package:emall/features/authentification/Views/login_page.dart';
import 'package:emall/features/authentification/Views/signup_page.dart';
import 'package:get/get.dart';

class AppRoutes {
 static const signUp = '/sign_up';
 static const login = '/login';
 
  static List<GetPage> routes = [
    GetPage(name: signUp, page: () => SignUpPage()),
    GetPage(name: login, page: () => LoginPage()),
  
  ];
}