import 'package:flutter/material.dart';

import '../../../../config/router/app_route.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              children: List.generate(
                _staticOrders.length,
                    (index) => OrderCard(order: _staticOrders[index]),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_rounded),
                  label: 'Order',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              currentIndex: 1, // Index of the current page
              onTap: (index) {
                // Handle navigation based on index
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, AppRoute.dashRoute);
                    break;
                  case 1:
                    Navigator.pushNamed(context, AppRoute.orderRoute);
                    break;
                  // Stay on the Order screen (current page)

                  case 2:
                    Navigator.pushNamed(context, AppRoute.CartRoute);
                    break;
                  // Navigate to Cart screen
                    break;
                  case 3:
                    Navigator.pushNamed(context, AppRoute.profileRoute);
                    break;

                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order["orderId"]}'),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var item in order['cartItems'])
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          item['productId']['productImageUrl'],
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 8.0),
                        Text(item['productId']['productName']),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Address: ${order["address"]}'),
            Text('Total: \$${order["total"]}'),
            Text('Status: ${order["status"]}'),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> _staticOrders = [
  {
    "orderId": "ORDER-NO1709488603741",
    "cartItems": [
      {"productId": {"productImageUrl": "assets/images/Husky.jfif", "productName": "Husky"}},
    ],
    "address": "Maitidevi, Kathmandu, Bagmati, nepal",
    "total": 12000,
    "status": "Pending",
  },
];
