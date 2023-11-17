import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_pet_shop/view/homepage_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context)=>Homepage(),
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
