// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';
// import 'package:online_pet_shop/feature/product/presentation/view_model/product_view_model.dart';

// class ProductView extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final productState = ref.watch(productViewModelProvider);

//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         height: 80,
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             buildNavBarItem(Icons.home_filled, "Home", 0),
//             buildNavBarItem(Icons.category_rounded, "Products", 1),
//             buildNavBarItem(Icons.add_shopping_cart, "Cart", 2),
//             buildNavBarItem(Icons.notification_add_rounded, "Notifications", 3),
//           ],
//         ),
//       ),
//        body: ListView.builder(
//         itemCount: products?.length ?? 0,
//         itemBuilder: (context, index) {
//           ProductEntity? product = products?[index];
//           return GestureDetector(
//             onTap: () {
//               List<ProductEntity?>? products = productState.products;
//               final args =
//               ModalRoute.of(context)!.settings.arguments as List<String?>;
//               final productID = args[0] ?? 'productID';
//               final productName = args[1] ?? 'productName';
//               final productPrice = args[2] ?? 'productPrice';
//               // final plantDescription = args[3] ?? 'plantDescription';
//               final productCategory = args[3] ?? 'productCategory';
//               final productImageURL = args[4];
//               'productImage';
//             },


//       backgroundColor: Color(0xfFE9EBEA),
//       body: productState.isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: productState.products.length,
//         itemBuilder: (context, index) {
//           final product = productState.products[index];
//           return Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18),
//                 child: Row(
//                   children: [
//                     Container(
//                       child: Column(
//                         children: [
//                           Image(
//                             height: 200,
//                             width: 200,
//                             image: NetworkImage( productState.products[index].productImageUrl),

//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 0, right: 180),
//                 child: Text(
//                  productState.products[index].productName,
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 0, right: 180),
//                 child: Text(
//                   "Rs ${ productState.products[index].productPrice}",
//                   style: TextStyle(
//                     fontSize: 17.0,
//                     fontWeight: FontWeight.w900,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 0, right: 180),
//                 child: Text(
//                   productState.products[index].productCategory,
//                   style: TextStyle(
//                     fontSize: 17.0,
//                     fontWeight: FontWeight.w900,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(right: 170),
//                 child: SizedBox(
//                   child: MaterialButton(
//                     elevation: 0.0,
//                     highlightElevation: 0.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     color: Color.fromRGBO(216, 129, 47, 20),
//                     padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
//                     onPressed: () {
//                       // Handle button press
//                     },
//                     child: Text(
//                       "ADD TO CART",
//                       style: TextStyle(
//                         fontSize: 10.0,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//                child: ClipRRect(
//                 borderRadius: BorderRadius.circular(😎,
//                 child: Image.network(
//                 product?.productImageUrl ??
//                 '', // Replace with actual image URL
//                 width: 100,
//                 height: 300,
//                 fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget buildNavBarItem(IconData icon, String label, int index) {
//     return InkWell(
//       onTap: () {
//         // Handle navigation
//       },
//       child: Column(
//         children: [
//           Icon(icon, color: Colors.black), // Update color as needed
//           Text(
//             label,
//             style: TextStyle(color: Colors.black), // Update color as needed
//           ),
//         ],
//       ),
//     );
//   }
// }

//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';
import 'package:online_pet_shop/feature/product/presentation/view_model/product_view_model.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductView> createState() => _ProductState();
}

class _ProductState extends ConsumerState<ProductView> {
  // Define a Set to store the indices of products added to the wishlist
  Set<int> wishlistIndices = Set<int>();

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewModelProvider);
    List<ProductEntity?>? products = productState.products;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products?.length ?? 0,
        itemBuilder: (context, index) {
          ProductEntity? product = products?[index];
          // Check if this product is in the wishlist
          bool isInWishlist = wishlistIndices.contains(index);
          return GestureDetector(
            onTap: () {
              List<ProductEntity?>? products = productState.products;
              final args =
              ModalRoute.of(context)!.settings.arguments as List<String?>;
              final productId = args[0] ?? 'productId';
              final productName = args[1] ?? 'productName';
              final productPrice = args[2] ?? 'productPrice';
              // final plantDescription = args[3] ?? 'plantDescription';
              final productCategory = args[3] ?? 'productCategory';
              final productImageURL = args[4];
              'productImage';
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
                              // Add to cart functionality
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
                            isInWishlist
                                ? Icons.favorite
                                : Icons.favorite_border,
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
    );
  }
}

