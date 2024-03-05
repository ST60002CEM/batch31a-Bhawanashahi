import 'package:flutter/material.dart';
import 'package:online_pet_shop/feature/cart/presentation/view/cart_view.dart';
import '../../../../config/router/app_route.dart';

class Order extends StatelessWidget {
  const Order({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xfFE9EBEA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Your Orders",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(thickness: 1),
            // Add your order items here
            buildOrderItem(context),
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
          // Navigate to Notifications screen
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

  Widget buildOrderItem(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
          image: DecorationImage(
            image: AssetImage('assets/images/rot.jfif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text("Rot whiller", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quantity: 1"),
          Text("Price: \$100"),
        ],
      ),
      onTap: () {
        // Handle tapping on the order item
      },
    );
  }
}
