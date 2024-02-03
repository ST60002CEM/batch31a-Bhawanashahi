// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../domain/entity/contact_entity.dart';
// import '../../domain/use_case/add_contact_usecase.dart';
// import '../../domain/use_case/get_all_contact_usecase.dart';
// import '../state/contact_state.dart';

// final contactViewModelProvider =
// StateNotifierProvider.autoDispose<ContactViewModel, ContactState>(
//       (ref) => ContactViewModel(
//     addContactUsecase: ref.read(addContactUsecaseProvider),
//     getAllContactUsecase: ref.read(getAllContactUsecaseProvider),
//   ),
// );

// class ContactViewModel extends StateNotifier<ContactState> {
//   final AddContactUsecase addContactUsecase;
//   final GetAllContactUsecase getAllContactUsecase;

//   ContactViewModel({
//     required this.addContactUsecase,
//     required this.getAllContactUsecase,
//   }) : super(ContactState.initialState()) {
//     getAllContact();
//   }

//   void addContact(ContactEntity contact) {
//     state = state.copyWith(isLoading: true);
//     addContactUsecase.addContact(contact).then((value) {
//       value.fold(
//             (failure) => state = state.copyWith(isLoading: false),
//             (success) {
//           state = state.copyWith(isLoading: false, showMessage: true);
//           getAllContact();
//         },
//       );
//     });
//   }

//   void getAllContact() {
//     state = state.copyWith(isLoading: true);
//     getAllContactUsecase.getAllContact().then((value) {
//       value.fold(
//             (failure) => state = state.copyWith(isLoading: false),
//             (contacts) {
//           state = state.copyWith(isLoading: false, contacts: contacts);
//         },
//       );
//     });
//   }

//   void resetMessage(bool value) {
//     state = state.copyWith(showMessage: value);
//   }
// }
