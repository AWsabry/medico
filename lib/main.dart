import 'package:flutter/material.dart';
import 'package:medico_app/home.dart';
import 'package:medico_app/splash/splash_screen.dart';
import 'package:medico_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: const SplashScreen(),
    );
  }
}
