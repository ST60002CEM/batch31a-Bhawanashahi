// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../domain/entity/contact_entity.dart';
// import '../view_model/contact_view_model.dart';

// class LoadContact extends StatelessWidget {
//   final WidgetRef ref;
//   final List<ContactEntity> lstContact;
//   const LoadContact({super.key, required this.lstContact, required this.ref});
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: lstContact.length,
//       itemBuilder: ((context, index) => ListTile(
//         title: Text(lstContact[index].email),
//         subtitle: Text(lstContact[index].message),
//         trailing: IconButton(
//             onPressed: () {
//               showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text(
//                         'Are you sure you want to delete ${lstContact[index].email}?'),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('No'),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           ref
//                               .read(contactViewModelProvider.notifier);
//                               // .deleteContact(context, lstContact[index]);
//                         },
//                         child: const Text('Yes'),
//                       ),
//                     ],
//                   ));
//             },
//             icon: const Icon(Icons.delete, color: Colors.red)),
//       )),
//     );
//   }
// }
