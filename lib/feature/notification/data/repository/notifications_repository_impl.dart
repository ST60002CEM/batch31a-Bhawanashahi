// data/repositories/notification_repository_impl.dart


import '../../domain/entity/notifications.dart';
import '../../domain/repository/notifications_repository.dart';
import '../data_source/notifications_Remote_data_Source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Notification>> getNotifications({required int page}) async {
    return await remoteDataSource.getNotifications(page: page);
  }
}
