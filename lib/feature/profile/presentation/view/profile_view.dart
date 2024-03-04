import 'package:flutter/material.dart';
import 'package:online_pet_shop/config/router/app_route.dart';

class ProfileView extends StatelessWidget {
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
                Navigator.pushNamed(context, '/wishlist');
              },
              child: Text('My Wishlist'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to contact us page
                Navigator.pushNamed(context,  AppRoute.contactRoute);
              },
              child: Text('Contact Us'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logout logic goes here
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}


