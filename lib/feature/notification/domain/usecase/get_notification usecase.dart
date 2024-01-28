// domain/usecases/get_notifications_usecase.dart


import '../entity/notifications.dart';

abstract class GetNotificationsUseCase {
  Future<List<Notification>> execute({required int page});
}
