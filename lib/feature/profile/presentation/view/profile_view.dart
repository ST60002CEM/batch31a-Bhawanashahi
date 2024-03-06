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
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image widget for the banner
              Image.asset(
                'assets/images/b.png',
                height: 200, // Adjust the height as needed
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              _buildOptionButton(
                icon: Icons.person,
                label: 'Profile Update',
                onPressed: () {
                  Navigator.pushNamed(context, '/profile_update');
                },
              ),
              SizedBox(height: 16),
              _buildOptionButton(
                icon: Icons.favorite,
                label: 'My Wishlist',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.favoriteRoute);
                },
              ),
              SizedBox(height: 16),
              _buildOptionButton(
                icon: Icons.contact_support,
                label: 'Contact Us',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.contactRoute);
                },
              ),
              SizedBox(height: 16),
              _buildOptionButton(
                icon: Icons.logout,
                label: 'Logout',
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRoute.loginRoute);
                },
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
            _buildNavBarItem(Icons.home_filled, "Home", 0, context),
            _buildNavBarItem(Icons.category_rounded, "Order", 1, context),
            _buildNavBarItem(Icons.add_shopping_cart, "Cart", 2, context),
            _buildNavBarItem(Icons.person, "Profile", 3, context),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Color(0xFFD8812F),
        elevation: 3,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(icon),
      label: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildNavBarItem(
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
            Navigator.pushNamed(context, AppRoute.profileRoute);
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
