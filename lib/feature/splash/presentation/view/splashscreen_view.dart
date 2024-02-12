import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_pet_shop/feature/auth/presentation/view/login_view.dart';
import 'package:online_pet_shop/feature/auth/presentation/view/register_view.dart';
import 'package:online_pet_shop/feature/home/presentation/view/homepage_view.dart';
import 'package:online_pet_shop/feature/notification/presentation/view/notification_view.dart';

import '../../../contact/presentation/view/add_contact_view.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context)=>LoginView(),
          ));
    });

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
        color:  Colors.white,
          child: Image.asset(
          "assets/images/logo.png",
          width: 2000,
          height: 3000,
        ),

        )

    );
  }
}
