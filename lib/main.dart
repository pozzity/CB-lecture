import 'package:flutter/material.dart';

void main() {
  runApp(const CBLectureApp());
}

/// The main entry widget of our application.
class CBLectureApp extends StatelessWidget {
  /// Construct a new [CBLectureApp].
  const CBLectureApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Center(
            child: Text('Flutter Demo Home Page'),
          ),
        ),
      );
}
