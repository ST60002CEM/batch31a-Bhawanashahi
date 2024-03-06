import 'package:flutter/material.dart';
import 'package:online_pet_shop/config/router/app_route.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int quantity = 1;
  double pricePerItem = 12000.00;

  @override
  Widget build(BuildContext context) {
    double total = quantity * pricePerItem;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.black, // Theme color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCartItem(),
            _buildAddressSection(),
            _buildTotalSection(total),
          ],
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

  Widget _buildCartItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Husky.jfif'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Husky',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Price: \$${pricePerItem.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text(quantity.toString()), // Quantity
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFFF5EE), // Light orange color
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8.0),
            // Text fields for address
            TextField(
              decoration: InputDecoration(
                labelText: 'Street',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'City',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Country',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'State',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalSection(double total) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total: \$${total.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              // Proceed to checkout
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xffD8812F), // Theme color
            ),
            child: Text('Place Order'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, int index, BuildContext context) {
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
