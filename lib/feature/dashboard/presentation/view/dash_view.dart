import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/config/router/app_route.dart';
import 'package:online_pet_shop/feature/dashboard/domain/entity/product.entity.dart';
import 'package:online_pet_shop/feature/dashboard/presentation/view_model/product_view_model.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardView> createState() => _ProductState();
}

class _ProductState extends ConsumerState<DashboardView> {
  Set<int> wishlistIndices = Set<int>();

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewModelProvider);
    List<ProductEntity?>? products = productState.products;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavBarItem(Icons.home_filled, "Home", 0),
            buildNavBarItem(Icons.category_rounded, "Order", 1),
            buildNavBarItem(Icons.add_shopping_cart, "Cart", 2),
            buildNavBarItem(Icons.notification_add_rounded, "Notifications", 3),
          ],
        ),
      ),
      backgroundColor: Color(0xfFE9EBEA),
      body: SingleChildScrollView(
        child: Column(
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
                          borderSide: const BorderSide(color: Color(0xffD8812F)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image(
                    height: 50,
                    width: 40,
                    image: AssetImage('assets/images/pp.png'),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Image(
              image: AssetImage('assets/images/banner.png'),
            ),
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
                  Text(
                    "Pet and Pet Products",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products?.length ?? 0,
              itemBuilder: (context, index) {
                ProductEntity? product = products?[index];
                bool isInWishlist = wishlistIndices.contains(index);
                return GestureDetector(
                  onTap: () {
                    // Handle onTap logic here
                  },
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: Container(
                        width: 120,
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromRGBO(180, 200, 157, 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            product?.productImageUrl ?? '',
                            width: 100,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        product?.productName ?? '',
                        style: const TextStyle(
                          color: Color(0xffD8812F),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Category: ${product?.productCategory ?? ''}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Price: ${product?.productPrice ?? ''}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 150,
                                child: TextButton(
                                  onPressed: () {
                                    if (products != null && index < products.length) {
                                      ProductEntity? selectedProduct = products[index];
                                      if (selectedProduct != null) {
                                        ref.read(productViewModelProvider.notifier).addCart(selectedProduct);
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xffD8812F),
                                    primary: Colors.black,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isInWishlist ? Icons.favorite : Icons.favorite_border,
                                  color: isInWishlist ? Color(0xffD8812F) : null,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (isInWishlist) {
                                      wishlistIndices.remove(index);
                                    } else {
                                      wishlistIndices.add(index);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
          // Navigate to Home screen
            Navigator.pushNamed(context, AppRoute.dashRoute);
            break;
          case 1:
          // Navigate to Products screen
            Navigator.pushNamed(context, AppRoute.orderRoute);
            break;
          case 2:
          // Navigate to Cart screen
            Navigator.pushNamed(context, AppRoute.CartRoute);
            break;
          case 3:
          // Navigate to Notifications screen
          // Navigator.pushNamed(context, AppRoute.notification);
            break;
        }
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
