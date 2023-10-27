
import 'package:flutter/material.dart';
import 'package:online_pet_shop/app/routes/app_routes.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Online Pet Shop",
      initialRoute: AppRoute.dashboradRoute,
      routes: AppRoute.getApplicationRoute(),
    );

  }
}