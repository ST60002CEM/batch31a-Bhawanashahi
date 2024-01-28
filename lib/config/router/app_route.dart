import 'package:online_pet_shop/feature/auth/presentation/view/login_view.dart';
import 'package:online_pet_shop/feature/auth/presentation/view/register_view.dart';
import 'package:online_pet_shop/feature/cart/presentation/view/cart_view.dart';
import 'package:online_pet_shop/feature/contact/presentation/view/add_contact_view.dart';
import 'package:online_pet_shop/feature/home/presentation/view/homepage_view.dart';
import 'package:online_pet_shop/feature/splash/presentation/view/splashscreen_view.dart';


class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String googleMapRoute = '/googleMap';
  static const String CartRoute = '/cart';
  static const String contactRoute = '/contact';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashScreen(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const Homepage(),
      registerRoute: (context) => const RegisterView(),
      contactRoute: (context) =>  AddContactView(),
      CartRoute: (context) => CartView(),
      // batchStudentRoute: (context) => const BatchStudentView(null),
      // googleMapRoute: (context) => const GoogleMapView(),
    };
  }
}
