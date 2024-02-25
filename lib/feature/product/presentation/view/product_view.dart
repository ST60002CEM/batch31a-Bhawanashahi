import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/home/domain/entity/home.entity.dart';
import 'package:online_pet_shop/feature/home/presentation/view_model/home_view_model.dart';
import 'package:online_pet_shop/feature/product/presentation/view_model/product_view_model.dart';

class ProductView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState =  ref.watch(productViewModelProvider);
    final products = productState.products;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavBarItem(Icons.home_filled, "Home", 0),
            buildNavBarItem(Icons.category_rounded, "Products", 1),
            buildNavBarItem(Icons.add_shopping_cart, "Cart", 2),
            buildNavBarItem(Icons.notification_add_rounded, "Notifications", 3),
          ],
        ),
      ),
      backgroundColor: Color(0xfFE9EBEA),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 18, right: 10),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 320,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Pet and Pet Products..',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffD8812F),),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Image(
                  height: 50,
                  width: 40,
                  image: AssetImage('assets/images/pp.png'),
                ),
                SizedBox(
                  width:10,
                ),
              ],
            ),
          ),
          Image(
              image: AssetImage(
                  'assets/images/banner.png'
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                Container(
                  height: 5,
                  width: 130,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 280),
            child: Row(
              children: [
                Container(
                  height: 5,
                  width: 130,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("NEW ARRIVAL",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  height:200,
                                  width: 200,
                                  image: NetworkImage(item.productImageUrl),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 180, ),
                      child: Text(item.productName,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 180, ),
                      child: Text("Rs ${item.productPrice}",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 170),
                      child: SizedBox(
                        child: MaterialButton(
                          elevation: 0.0,
                          highlightElevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Color.fromRGBO(216, 129, 47, 20),
                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
                          onPressed: () {
                            // Handle button press
                          },
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        // Handle navigation
      },
      child: Column(
        children: [
          Icon(icon, color: Colors.black), // Update color as needed
          Text(
            label,
            style: TextStyle(color: Colors.black), // Update color as needed
          ),
        ],
      ),
    );
  }
}
