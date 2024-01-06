import 'package:flutter/material.dart';
import 'package:parking_space/constant/app_colors.dart';
import 'package:parking_space/presentation/home.dart';
import 'package:parking_space/presentation/register_space.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Space',
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const RegisterSpace(),
      },
      theme: ThemeData(
        backgroundColor: AppColors.white,
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
