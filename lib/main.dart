import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_pet_shop/feature/home/presentation/view/homepage_view.dart';
import 'package:online_pet_shop/view/login_view.dart';
import 'package:online_pet_shop/view/signup_view.dart';
import 'package:online_pet_shop/feature/splash/presentation/view/splashscreen_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
