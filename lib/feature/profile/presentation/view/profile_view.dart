// import 'package:flutter/material.dart';
//
//
// class ProfileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: ListView(
//         children: [
//           DrawerOption(
//             icon: Icons.person,
//             title: 'Profile',
//             onTap: () {
//               // Handle navigation to Profile screen
//             },
//           ),
//           DrawerOption(
//             icon: Icons.shopping_cart,
//             title: 'My Orders',
//             onTap: () {
//               // Handle navigation to My Orders screen
//             },
//           ),
//           DrawerOption(
//             icon: Icons.favorite,
//             title: 'Wishlist',
//             onTap: () {
//               // Handle navigation to Wishlist screen
//             },
//           ),
//           DrawerOption(
//             icon: Icons.rate_review,
//             title: 'My Reviews',
//             onTap: () {
//               // Handle navigation to My Reviews screen
//             },
//           ),
//           DrawerOption(
//             icon: Icons.contact_mail,
//             title: 'Contact Us',
//             onTap: () {
//               // Handle navigation to Contact Us screen
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DrawerOption extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//
//   const DrawerOption({
//     Key? key,
//     required this.icon,
//     required this.title,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(title),
//       onTap: onTap,
//     );
//   }
// }
//
//
//
