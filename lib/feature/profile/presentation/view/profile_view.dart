import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_pet_shop/config/router/app_route.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _initAccelerometerListener();
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  void _initAccelerometerListener() {
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      double y = event.y;
      double threshold = 9.0;

      if (y < -threshold) {
        _logout(context);
      }
    });
  }

  Future<bool> _logout(BuildContext context) async {
    // Perform logout logic here
    // For demonstration purposes, assuming logout is successful immediately
    // Replace this with your actual logout logic
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoute.loginRoute,
          (route) => false,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logout successful')),
    );
    return true; // Logout successful
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFFD8812F), // Set app bar color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to profile update page
                  Navigator.pushNamed(context, '/profile_update');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD8812F), // Set button color
                ),
                child: Text('Profile Update', style: TextStyle(color: Colors.white)), // Set text color
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to wishlist page
                  Navigator.pushNamed(context, AppRoute.favoriteRoute);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD8812F), // Set button color
                ),
                child: Text('My Wishlist', style: TextStyle(color: Colors.white)), // Set text color
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to contact us page
                  Navigator.pushNamed(context, AppRoute.contactRoute);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD8812F), // Set button color
                ),
                child: Text('Contact Us', style: TextStyle(color: Colors.white)), // Set text color
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _logout(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD8812F), // Set button color
                ),
                child: Text('Logout', style: TextStyle(color: Colors.white)), // Set text color
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavBarItem(Icons.home_filled, "Home", 0, context),
            buildNavBarItem(Icons.category_rounded, "Order", 1, context),
            buildNavBarItem(Icons.add_shopping_cart, "Cart", 2, context),
            buildNavBarItem(Icons.person, "Profile", 3, context),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, AppRoute.dashRoute);
            break;
          case 1:
            Navigator.pushNamed(context, AppRoute.orderRoute);
            break;
          case 2:
            Navigator.pushNamed(context, AppRoute.CartRoute);
            break;
          case 3:
          // Navigate to Profile screen (current screen)
            break;
        }
      },
      child: Column(
        children: [
          Icon(icon, color: Color(0xFFD8812F)), // Set icon color
          Text(label, style: TextStyle(color: Color(0xFFD8812F))), // Set text color
        ],
      ),
    );
  }
}
