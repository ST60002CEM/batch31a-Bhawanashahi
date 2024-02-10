import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/contact_entity.dart';
import '../view_model/contact_view_model.dart';

class AddContactView extends ConsumerWidget {
  AddContactView({Key? key}) : super(key: key);

  final gap = const SizedBox(height: 8);
  final nameController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactState = ref.watch(contactViewModelProvider);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (contactState.showMessage) {
        showSnackBar(message: 'Contact Added', context: context);
        ref.read(contactViewModelProvider.notifier).resetMessage(false);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFd8812F), // Set border color here
                ),
                borderRadius: BorderRadius.circular(20.0), // Set border radius here
              ),
              child: Column(
                children: [
                  gap,
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFd8812F), // Set text color here
                      ),
                    ),
                  ),
                  gap,
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Contact Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter contact name';
                      }
                      return null;
                    },
                  ),
                  gap,
                  TextFormField(
                    controller: messageController,
                    maxLines: 5, // Increase the number of lines
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type your message here...',
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      // Add padding vertically
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Message';
                      }
                      return null;
                    },
                  ),
                  gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ContactEntity contact = ContactEntity(
                          contactName: nameController.text,
                          message: messageController.text,
                        );
                        ref.read(contactViewModelProvider.notifier).addContact(contact);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFd8812F), // Set background color here
                      ),
                      child: const Text('Send your queries'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'List of Messages',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  gap,
                  contactState.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    shrinkWrap: true,
                    itemCount: contactState.contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          contactState.contacts[index].contactName,
                          semanticsLabel: contactState.contacts[index].message,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          contactState.contacts[index].contactId ?? 'No id',
                          style: const TextStyle(
                            color: Colors.indigo,
                            fontSize: 12,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // ref.read(contactViewModelProvider.notifier)
                            //     .deleteContact(contactState.contacts[index].contactId);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
