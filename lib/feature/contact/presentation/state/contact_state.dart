//
//
// import '../../domain/entity/contact_entity.dart';
//
// class ContactState {
//   final bool isLoading;
//   final List<ContactEntity> contacts;
//   final bool showMessage;
//
//   ContactState({
//     required this.isLoading,
//     required this.contacts,
//     required this.showMessage,
//   });
//
//   factory ContactState.initialState() => ContactState(
//         isLoading: false,
//     contacts: [],
//         showMessage: false,
//       );
//
//   ContactState copyWith({
//     bool? isLoading,
//     List<ContactEntity>? contacts,
//     bool? showMessage,
//   }) {
//     return ContactState(
//       isLoading: isLoading ?? this.isLoading,
//       contacts: contacts ?? this.contacts,
//       showMessage: showMessage ?? this.showMessage,
//     );
//   }
// }
