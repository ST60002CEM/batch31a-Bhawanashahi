import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';
import 'package:online_pet_shop/config/router/app_route.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  double _proximityValue = 0;
  final List<StreamSubscription<dynamic>> _streamSubscription = [];

  @override
  void initState() {
    bool initialEventProcessed = false;

    _streamSubscription.add(proximityEvents!.listen((event) {
      if (!initialEventProcessed) {
        initialEventProcessed = true;
        return;
      }

      setState(() {
        _proximityValue = event.proximity;
        if (_proximityValue >= 4) {
          _performLogout();
        }
      });
    }));

    super.initState();
  }

  @override
  void dispose() {
    for (var subscription in _streamSubscription) {
      subscription.cancel();
    }
    super.dispose();
  }

  void _performLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              // ref.read(homeViewModelProvider.notifier).signOut(context);
              Navigator.pushReplacementNamed(context, AppRoute.loginRoute);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            // Navigator.pushReplacementNamed(context, AppRoute.loginRoute);
            // },
            child: const Text('No'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor:
            Color(0xFFD8812F), // Foreveryoung Beauty App's theme color
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
                  primary:
                      Colors.white, // Foreveryoung Beauty App's button color
                  onPrimary: Color(
                      0xFFD8812F), // Foreveryoung Beauty App's button text color
                ),
                child: Text(
                    'Profile Update'), // Foreveryoung Beauty App's button text style
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to wishlist page
                  Navigator.pushNamed(context, AppRoute.favoriteRoute);
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Foreveryoung Beauty App's button color
                  onPrimary: Color(
                      0xFFD8812F), // Foreveryoung Beauty App's button text color
                ),
                child: Text(
                    'My Wishlist'), // Foreveryoung Beauty App's button text style
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to contact us page
                  Navigator.pushNamed(context, AppRoute.contactRoute);
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Foreveryoung Beauty App's button color
                  onPrimary: Color(
                      0xFFD8812F), // Foreveryoung Beauty App's button text color
                ),
                child: Text(
                    'Contact Us'), // Foreveryoung Beauty App's button text style
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRoute.loginRoute);
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Foreveryoung Beauty App's button color
                  onPrimary: Color(
                      0xFFD8812F), // Foreveryoung Beauty App's button text color
                ),
                child: Text(
                    'Logout'), // Foreveryoung Beauty App's button text style
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

  Widget buildNavBarItem(
      IconData icon, String label, int index, BuildContext context) {
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
          Icon(icon, color: Colors.black),
          Text(label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
