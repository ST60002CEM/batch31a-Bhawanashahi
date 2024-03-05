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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to profile update page
                Navigator.pushNamed(context, '/profile_update');
              },
              child: Text('Profile Update'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to wishlist page
                Navigator.pushNamed(context, AppRoute.favoriteRoute);
              },
              child: Text('My Wishlist'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to contact us page
                Navigator.pushNamed(context, AppRoute.contactRoute);
              },
              child: Text('Contact Us'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _logout(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
