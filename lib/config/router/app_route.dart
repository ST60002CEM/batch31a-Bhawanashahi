
import 'package:online_pet_shop/feature/auth/presentation/view/login_view.dart';
import 'package:online_pet_shop/feature/auth/presentation/view/register_view.dart';
import 'package:online_pet_shop/feature/cart/presentation/view/cart_view.dart';
import 'package:online_pet_shop/feature/contact/presentation/view/add_contact_view.dart';
import 'package:online_pet_shop/feature/dashboard/presentation/view/dash_view.dart';
import 'package:online_pet_shop/feature/favorite/presentation/favorite_view.dart';
import 'package:online_pet_shop/feature/order/presentation/view/order_view.dart';
import 'package:online_pet_shop/feature/profile/presentation/view/profile_view.dart';
import 'package:online_pet_shop/feature/splash/presentation/view/splashscreen_view.dart';


class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String orderRoute = '/order';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String googleMapRoute = '/googleMap';
  static const String CartRoute = '/cart';
  static const String contactRoute = '/contact';
  static const String dashRoute = '/product';
   static const String profileRoute = '/profile';
    static const String favoriteRoute = '/favorite';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashScreen(),
      loginRoute: (context) => const LoginView(),
      orderRoute: (context) =>  Order(),
      registerRoute: (context) => const RegisterView(),
      contactRoute: (context) =>  AddContactView(),
      dashRoute: (context) =>  DashboardView(),
      CartRoute: (context) => CartView(),
       profileRoute: (context) => ProfileView(),
       favoriteRoute:(context)=>FavoriteView(),
      // batchStudentRoute: (context) => const BatchStudentView(null),
      // googleMapRoute: (context) => const GoogleMapView(),
    };
  }
}
