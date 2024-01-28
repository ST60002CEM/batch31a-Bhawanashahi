// // presentation/bloc/notification_bloc.dart
//
//
// import '../../domain/entity/notifications.dart';
// import '../../domain/usecase/get_notification usecase.dart';
//
// part 'notification_state.dart';
//
// class NotificationBloc extends Cubit<NotificationState> {
//   final GetNotificationsUseCase getNotificationsUseCase;
//
//   NotificationBloc({required this.getNotificationsUseCase})
//       : super(NotificationInitial());
//
//   Future<void> getNotifications({required int page}) async {
//     emit(NotificationLoading());
//     try {
//       final notifications = await getNotificationsUseCase.execute(page: page);
//       emit(NotificationLoaded(notifications: notifications));
//     } catch (e) {
//       emit(NotificationError(message: 'Failed to load notifications'));
//     }
//   }
// }
