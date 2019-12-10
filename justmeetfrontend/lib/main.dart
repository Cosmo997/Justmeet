import 'package:flutter/material.dart';
import 'view/routes/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Disabilita la scritta "debug" in alto a destra
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}
