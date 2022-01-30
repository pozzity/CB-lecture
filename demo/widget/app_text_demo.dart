import 'package:cb_lecture/widgets/app_text/app_text_model.dart';
import 'package:cb_lecture/widgets/app_text/app_text_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DemoApp());

/// The demo application
class DemoApp extends StatelessWidget {
  /// Constructs a new [DemoApp].
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'App Text Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const AppText(text: 'App Text Demo Bar'),
          ),
          body: Column(
            children: const <AppText>[
              /// Test on header size
              AppText(text: 'Hello World', textMode: AppTextMode.extraheader),
              AppText(text: 'Hello World', textMode: AppTextMode.header),
              AppText(text: 'Hello World', textMode: AppTextMode.subHeader),
              AppText(text: 'Hello World', textMode: AppTextMode.subHeader2),
              AppText(text: 'Hello World', textMode: AppTextMode.body),
              AppText(text: 'Hello World', textMode: AppTextMode.body2),
              AppText(text: 'Hello World', textMode: AppTextMode.note),

              /// Test on custom color
              AppText(
                text: 'Hello World',
                textMode: AppTextMode.extraheader,
                color: Colors.green,
              ),
              AppText(
                text: 'Hello World',
                textMode: AppTextMode.header,
                color: Colors.red,
              ),
              AppText(
                text: 'Hello World',
                textMode: AppTextMode.subHeader,
                color: Colors.yellow,
              ),
              AppText(
                text: 'Hello World',
                textMode: AppTextMode.subHeader2,
                color: Colors.green,
              ),
              AppText(
                text: 'Hello World',
                textMode: AppTextMode.body,
                color: Colors.red,
              ),
              AppText(
                text: 'Hello World',
                textMode: AppTextMode.body2,
                color: Colors.yellow,
              ),

              /// with custom font and custom color
              AppText(
                text: 'Hello World',
                textMode: AppTextMode.note,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),

              /// with custom font and custom color and custom style
              AppText(
                text: 'Hello World',
                textMode: AppTextMode.note,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                textStyle: TextStyle(
                    backgroundColor: Colors.red,
                    fontStyle: FontStyle.italic,
                    color: Colors.pink),
              ),
            ],
          ),
        ),
      );
}
