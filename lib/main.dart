// import 'package:calendrierbiblic/pages/first_steps_page.dart';
import 'package:calendrierbiblic/generated/l10n.dart';
import 'package:calendrierbiblic/pages/first_steps_page.dart';
import 'package:calendrierbiblic/pages/home_page.dart' show defaultRouteObserver;
import 'package:calendrierbiblic/utils/firebase.dart' show FbUtils;
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();

NotificationAppLaunchDetails notificationAppLaunchDetails;

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}

void main() async {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject
            .add(ReceivedNotification(id: id, title: title, body: body, payload: payload));
      });
  var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    selectNotificationSubject.add(payload);
  });
  runApp(MyApp());
}

// zone() {
//   runZonedGuarded<Future<void>>(
//     () async {
//       runApp(MyApp());
//     },
//     (dynamic error, StackTrace stackTrace) {
//       print("=================== CAUGHT DART ERROR");
//       print(error);
//       print("=================== STACK TRACE DART ERROR");
//       print("=================== ");
//       print(stackTrace);
//       zone();
//     },
//   );
// }

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
//      await Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => CalendrierPage(payload)),
//      );
      fn.log(ulrich_selected_Notification: payload);
    });
  }

  @override
  void initState() {
    super.initState();
    _configureSelectNotificationSubject();
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FbUtils().analytics.logAppOpen();
    return MaterialApp(
      title: "Calendrier biblique",
      localizationsDelegates: [S.delegate],
      navigatorObservers: [defaultRouteObserver, FbUtils().observer],
      color: Colors.white,
      theme: ThemeData(
        backgroundColor: Colors.white,
        fontFamily: "Chandas",
        primarySwatch: Colors.brown,
      ),
      // home: FirstStepPage(),
      home: FirstStepPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
