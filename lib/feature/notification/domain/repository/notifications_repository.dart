// domain/repositories/notification_repository.dart


import '../entity/notifications.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getNotifications({required int page});
}
