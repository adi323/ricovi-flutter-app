import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricovi/pages/splashscreen.dart';


void main() {
  
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      home: const SplashScreen(),
    );
  }
}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}