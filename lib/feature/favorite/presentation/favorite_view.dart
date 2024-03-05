import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of items in the favorites
        itemBuilder: (context, index) {
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
                          image: NetworkImage('https://via.placeholder.com/150'),
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
                          'Product Name',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Seller: ABC Store',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Price: \$10.00',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                // Remove item from favorites
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {
                                // Add item to cart
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
        },
      ),
    );
  }
}
