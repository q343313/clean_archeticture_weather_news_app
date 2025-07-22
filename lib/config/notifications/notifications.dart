


//
// import 'dart:ui';
//
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:expence_tracker_app/repository/screens/navigation_screens/navigationsscreens.dart';
// import 'package:flutter/material.dart';
//
// import '../main.dart';
//
// Future<void>initializeNotification()async{
//   await AwesomeNotifications().initialize(
//       null,
//       [NotificationChannel(
//           channelGroupKey: "my_first_notification",
//           channelKey: "my_first_notification",
//           channelName: "first notification channel",
//           channelDescription: "my first message in notification",
//           defaultColor: Colors.blue,
//           ledColor: Colors.red,
//           importance: NotificationImportance.Max,
//           channelShowBadge: true,
//           onlyAlertOnce: true,
//           playSound: true,
//           criticalAlerts: true
//       )
//
//       ],
//       channelGroups: [
//         NotificationChannelGroup(
//             channelGroupKey: "my_first_notification",
//             channelGroupName: "Group 1")
//       ],debug: true);
//
//   await AwesomeNotifications().isNotificationAllowed().then((value)async{
//     if(!value){
//       await AwesomeNotifications().requestPermissionToSendNotifications();
//     }
//   });
//
//   await AwesomeNotifications().setListeners(
//       onActionReceivedMethod: onActionReceivedMethod,
//       onNotificationCreatedMethod:onNotificationCreatedMethod,
//       onDismissActionReceivedMethod: onDismissActionReceivedMethod,
//       onNotificationDisplayedMethod: onNotificationDisplayedMethod
//   );
// }
//
// Future<void>onActionReceivedMethod(ReceivedAction recievedaction)async{
//   debugPrint("On Action Recied");
//   final payload = recievedaction.payload??{};
//   if(payload["navigate"] == "true"){
//     MyApp.navigatorKey.currentState?.push(MaterialPageRoute(builder: (_)=>Navigationsscreens()));
//   }
// }
//
// Future<void>onNotificationCreatedMethod(ReceivedNotification receivedNotification)async {
//   debugPrint("On Notification created method");
// }
// Future<void>onDismissActionReceivedMethod(ReceivedAction recievedaction)async{
//   debugPrint("On Notification Recieved");
// }
//
// Future<void>onNotificationDisplayedMethod(ReceivedNotification recievednotification)async{
//   debugPrint("On Notification Displayed method");
// }
//
// Future<void>showNotification({
//   required final String title,
//   required final String body,
//   final String? summary,
//   final Map<String, String>? payload,
//   final ActionType actiontype = ActionType.Default,
//   final NotificationLayout notificationlayout = NotificationLayout.Default,
//   final NotificationCategory? category,
//   final String? bigpicture,
//   final List<NotificationActionButton>? actionbutton,
//   final bool scheduled = false,
//   final Duration? interval, // in minutes
// }) async {
//   assert(!scheduled || (scheduled && interval != null));
//
//   await AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       id: -1,
//       channelKey: "my_first_notification",
//       title: title,
//       body: body,
//       summary: summary,
//       bigPicture: bigpicture,
//       category: category,
//       payload: payload,
//       actionType: actiontype,
//       notificationLayout: notificationlayout,
//     ),
//     actionButtons: actionbutton,
//     schedule: scheduled
//         ? NotificationInterval(
//       interval : interval,
//       timeZone: await AwesomeNotifications.localTimeZoneIdentifier,
//       repeats: true,
//       preciseAlarm: true,
//     )
//         : null,
//   );
// }
//
//
// Future<void> scheduleDailyNotification({
//   required String title,
//   required String body,
//   required TimeOfDay time,
//   Map<String, String>? payload,
// }) async {
//   await AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
//       channelKey: "my_first_notification",
//       title: title,
//       body: body,
//       payload: payload,
//       notificationLayout: NotificationLayout.Default,
//     ),
//     schedule: NotificationCalendar(
//       hour: time.hour,
//       minute: time.minute,
//       second: 0,
//       millisecond: 0,
//       repeats: true,
//       timeZone: await AwesomeNotifications.localTimeZoneIdentifier,
//     ),
//   );
// }
//
//
// @pragma('vm:entry-point')
// void showMorningNotification() {
//   AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       id: 1,
//       channelKey: "my_first_notification",
//       title: "🌅 Good Morning!",
//       body: "Start your day by checking your expenses.",
//       notificationLayout: NotificationLayout.Default,
//     ),
//   );
// }
//
// @pragma('vm:entry-point')
// void showNightNotification() {
//   AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       id: 2,
//       channelKey: "my_first_notification",
//       title: "🌙 Night Reminder!",
//       body: "Don't forget to log your expenses before bed.",
//       notificationLayout: NotificationLayout.Default,
//     ),
//   );
// }



import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:clean_architecture_weather_new_app/config/route/routename.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_weather_new_app/main.dart';

Future<void>initializenotification()async{

  await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: "clean_coding",
            channelName: "clean_coding",
            channelDescription: "this is clean coding archotecture app",
          defaultColor: Colors.red,
          ledColor: Colors.lightBlueAccent,
          importance: NotificationImportance.Max,
          criticalAlerts: true,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
//           channelKey: "my_first_notification",
//           channelName: "first notification channel",
//           channelDescription: "my first message in notification",
//           defaultColor: Colors.blue,
//           ledColor: Colors.red,
//           importance: NotificationImportance.Max,
//           channelShowBadge: true,
//           onlyAlertOnce: true,
//           playSound: true,
//           criticalAlerts: true
        )
      ],channelGroups: [NotificationChannelGroup(
      channelGroupKey: "clean_coding",
      channelGroupName: "group 1",
  )],debug: true);


  await AwesomeNotifications().isNotificationAllowed().then((is_allowed)async{
    if(!is_allowed){
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  AwesomeNotifications().setListeners(
      onActionReceivedMethod: onNotificationCreatedMethod,
    onNotificationCreatedMethod:onotifioncreaedmethod ,
    onNotificationDisplayedMethod:onNotificationDisplayedMethod ,
    onDismissActionReceivedMethod: onDismissActionReceivedMethod,
  );

}

Future<void>onNotificationCreatedMethod(ReceivedAction recirved)async{
    debugPrint("Meesges Send");
    final payload= recirved.payload??{};
    if(payload["navigate"] == "true"){
      MyApp.navigatorKey.currentState?.pushNamed(RouteNames.navigation);
    }


}
Future<void>onotifioncreaedmethod(ReceivedNotification action)async{
  debugPrint("");
}

Future<void>onNotificationDisplayedMethod(ReceivedNotification action)async{
  debugPrint("");
}

Future<void>onDismissActionReceivedMethod(ReceivedAction action)async{
  debugPrint("");
}

Future<void>shownotification({
  required String title,
  required String body,
   String?summary,
  NotificationLayout notificationlayout = NotificationLayout.Default,
  Map<String,String>?payload,
  NotificationCategory category = NotificationCategory.Alarm,
  String?bigpicture,
  ActionType actiontype = ActionType.Default,
  List<NotificationActionButton>?notificationActionButton,
  final bool scheduled = false,
  final Duration? interval, // in minutes




})async{
  assert(!scheduled||scheduled && interval != null);
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 0,
          channelKey: "clean_coding",
        title: title,
        body: body,
        groupKey: "clean_coding",
        payload: payload,
        category: category,
        summary: summary,
        notificationLayout: notificationlayout,
        bigPicture: bigpicture,
        actionType: actiontype

      ),actionButtons: notificationActionButton,
  schedule: scheduled?NotificationInterval(
    interval: interval,
    timeZone: AwesomeNotifications.localTimeZoneIdentifier,
      repeats: true,
      preciseAlarm: true,
  ):null);
}


Future<void>showNotification({
  required final String title,
  required final String body,
  final String? summary,
  final Map<String, String>? payload,
  final ActionType actiontype = ActionType.Default,
  final NotificationLayout notificationlayout = NotificationLayout.Default,
  final NotificationCategory? category,
  final String? bigpicture,
  final List<NotificationActionButton>? actionbutton,
  final bool scheduled = false,
  final Duration? interval, // in minutes
}) async {
  assert(!scheduled || (scheduled && interval != null));

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: -1,
      channelKey: "clean_coding",
      title: title,
      body: body,
      summary: summary,
      bigPicture: bigpicture,
      category: category,
      payload: payload,
      actionType: actiontype,
      notificationLayout: notificationlayout,
    ),
    actionButtons: actionbutton,
    schedule: scheduled
        ? NotificationInterval(
      interval : interval,
      timeZone: await AwesomeNotifications.localTimeZoneIdentifier,
      repeats: true,
      preciseAlarm: true,
    )
        : null,
  );
}