
import 'package:flutter/material.dart';
import 'package:online_pet_shop/app/routes/app_routes.dart';
import 'package:online_pet_shop/app/theme/theme_data.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext contex




  ) {

    return MaterialApp(
      title:"Online Pet Shop",
      initialRoute: AppRoute.dashboradRoute,
      routes: AppRoute.getApplicationRoute(),
      theme: getApplicationTheme()
    );

  }
}