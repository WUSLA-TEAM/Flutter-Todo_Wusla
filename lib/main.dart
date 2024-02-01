import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wusla/components/fullScreen_box.dart';
import 'package:wusla/theme/light_theme.dart';
import 'Screens/home_page.dart';

void main() async {
  //init flutter
  await Hive.initFlutter();

  //box

  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: Home(),
    );
  }
}
