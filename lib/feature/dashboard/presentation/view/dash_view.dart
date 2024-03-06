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
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewModelProvider);
    List<ProductEntity?>? products = productState.products;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Handle notification icon tap
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Pet and Pet Products...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/b.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Available Pet and Pet Products',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products?.length ?? 0,
              itemBuilder: (context, index) {
                ProductEntity? product = products?[index];
                bool isInWishlist = wishlistIndices.contains(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300],
                          image: DecorationImage(
                            image: NetworkImage(product?.productImageUrl ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        product?.productName ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            'Category: ${product?.productCategory ?? ''}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Price: ${product?.productPrice ?? ''}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              isInWishlist ? Icons.favorite : Icons.favorite_border,
                              color: isInWishlist ? Colors.red : Colors.grey,
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
                          TextButton(
                            onPressed: () {
                              // Add to cart logic here
                            },
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xffD8812F),
                              primary: Colors.white,
                            ),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(Icons.home_filled, "Home", 0),
            buildNavBarItem(Icons.category_rounded, "Order", 1),
            buildNavBarItem(Icons.add_shopping_cart, "Cart", 2),
            buildNavBarItem(Icons.person, "Profile", 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
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
    );
  }
}
