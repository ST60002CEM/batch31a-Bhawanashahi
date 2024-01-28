// data/repositories/notification_repository_impl.dart

import '../../data/data_source/notifications_Remote_data_Source.dart';
import '../entity/notifications.dart';
import '../repository/notifications_repository.dart';


class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Notification>> getNotifications({required int page}) async {
    return await remoteDataSource.getNotifications(page: page);
  }
}
