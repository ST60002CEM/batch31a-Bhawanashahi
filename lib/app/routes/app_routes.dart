import 'package:online_pet_shop/view/login_view.dart';

import '../../view/dashboard_view.dart';


class AppRoute{
  AppRoute._();

  static const String dashboradRoute='/';
  static const String loginRoute='/login';



  static getApplicationRoute(){
    return{
      dashboradRoute: (context) => const DashboardView(),
      loginRoute: (context) => const LoginPage(),


    };
  }
}

