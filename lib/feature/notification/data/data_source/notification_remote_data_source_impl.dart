// data/datasources/notification_remote_data_source_impl.dart


import '../../domain/entity/notifications.dart';
import 'notifications_Remote_data_Source.dart';

class NotificationRemoteDataSourceImpl
    implements NotificationRemoteDataSource {
  @override
  Future<List<Notification>> getNotifications({required int page}) async {
    // Implement fetching data from your API or another data source
    // Return a list of notifications
    // Example: Dummy data for demonstration purposes
    return List.generate(
      10,
          (index) => Notification(
        id: index.toString(),
        message: 'Notification message $index',
        timestamp: DateTime.now(),
      ),
    );
  }
}
