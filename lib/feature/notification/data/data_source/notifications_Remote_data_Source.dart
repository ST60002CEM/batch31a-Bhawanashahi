// data/datasources/notification_remote_data_source.dart



import '../../domain/entity/notifications.dart';

abstract class NotificationRemoteDataSource {
  Future<List<Notification>> getNotifications({required int page});
}
