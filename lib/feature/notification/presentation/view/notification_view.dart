// // presentation/pages/notification_page.dart
//
// import 'package:flutter/material.dart';
//
// import '../bloc/notification_bloc.dart';
//
// class NotificationPage extends StatefulWidget {
//   @override
//   _NotificationPageState createState() => _NotificationPageState();
// }
//
// class _NotificationPageState extends State<NotificationPage> {
//   final NotificationBloc _notificationBloc = NotificationBloc();
//
//   @override
//   void initState() {
//     super.initState();
//     _notificationBloc.getNotifications(page: 1);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: BlocBuilder<NotificationBloc, NotificationState>(
//         bloc: _notificationBloc,
//         builder: (context, state) {
//           if (state is NotificationLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is NotificationLoaded) {
//             return _buildNotificationList(state.notifications);
//           } else if (state is NotificationError) {
//             return Center(
//               child: Text('Error: ${state.message}'),
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
//
//   Widget _buildNotificationList(List<Notification> notifications) {
//     return ListView.builder(
//       itemCount: notifications.length,
//       itemBuilder: (context, index) {
//         final notification = notifications[index];
//         return ListTile(
//           title: Text(notification.message),
//           subtitle: Text(notification.timestamp.toString()),
//         );
//       },
//     );
//   }
// }
