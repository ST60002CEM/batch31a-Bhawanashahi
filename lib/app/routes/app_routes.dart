

import 'package:online_pet_shop/view/signup_view.dart';

import '../../view/dashboard_view.dart';
import '../../view/login_view.dart';


class AppRoute{
  AppRoute._();

  static const String dashboradRoute='/';
  static const String loginRoute='/login';
  static const String signupRoute='/signup';




  static getApplicationRoute(){
    return{
      dashboradRoute: (context) => const DashboardView(),
      loginRoute: (context) =>  LoginPage(),
      signupRoute: (context) =>  SignUpPage(),



    };
  }
}

