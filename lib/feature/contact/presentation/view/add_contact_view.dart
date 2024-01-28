import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/contact_entity.dart';
import '../view_model/contact_view_model.dart';


class AddContactView extends ConsumerWidget {
  AddContactView({super.key});

  final gap = const SizedBox(height: 8);
  final contactController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactState = ref.watch(contactViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (contactState.showMessage) {
        showSnackBar(message: 'Contact Added', context: context);
        ref.read(contactViewModelProvider.notifier).resetMessage(false);
      }
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Contact',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: contactController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Contact Email',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
            ),
            gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ContactEntity contact =
                  ContactEntity(email: contactController.text, message: contactController.text);
                  ref.read(contactViewModelProvider.notifier).addContact(contact);
                },
                child: const Text('Add Contact'),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Contacts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            contactState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
              child: ListView.builder(
                itemCount: contactState.contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      contactState.contacts[index].email,
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
                        // ref
                        //     .read(batchViewModelProvider.notifier)
                        //     .deleteBatch(
                        //         batchState.batches[index].batchId);
                      },
                    ),
                  );
                },
              ),
            ),
            // batchState.showMessage
            //     ? showSnackBar(message: 'Batch Added', context: context)
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
