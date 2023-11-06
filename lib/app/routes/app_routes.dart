

import '../../view/dashboard_view.dart';
import '../../view/login_view.dart';


class AppRoute{
  AppRoute._();

  static const String dashboradRoute='/';
  static const String loginRoute='/login';



  static getApplicationRoute(){
    return{
      dashboradRoute: (context) => const DashboardView(),
      loginRoute: (context) =>  LoginPage(),



    };
  }
}

