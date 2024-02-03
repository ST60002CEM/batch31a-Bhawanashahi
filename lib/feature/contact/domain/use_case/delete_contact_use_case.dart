// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/failure/failure.dart';
// import '../repository/contact_repository.dart';

// final deleteContactsUsecaseProvider = Provider<DeleteContactUseCase>(
//   (ref) =>
//       DeleteContactUseCase(contactRepository: ref.read(contactRepositoryProvider)),
// );
// class DeleteContactUseCase{
//   final IContactRepository contactRepository;

//   DeleteContactUseCase({required this.contactRepository});

//    Future<Either<Failure, bool>> deleteContact(String id){
//     return contactRepository.deleteContact(id);
//    }


// }