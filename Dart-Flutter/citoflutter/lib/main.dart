import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeSettings();
  runApp(MaterialApp(
    home: Page1(),
  ));
}

Future<void> _initializeSettings() async {
  const AndroidInitializationSettings _initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: _initializationSettingsAndroid,
  );

  await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);
}

Future<void> selectNotification(String payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }
  /* await Navigator.push(
    context,
    MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
  ); */
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  double x = 0.0;
  double y = 0.0;
  List ss = [];
  double z = 0.0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Center(
              child: InkWell(
                onTap: () async => await pushCustomSoundNotification(),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      )),
    );
  }

  Future<void> pushCustomSoundNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'your channel id', 'your channel name', 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            sound: RawResourceAndroidNotificationSound('bhavupdate'),
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }
}
