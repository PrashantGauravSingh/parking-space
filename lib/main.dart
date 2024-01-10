import 'package:flutter/material.dart';
import 'package:parking_space/Providers/book_slot_provider.dart';
import 'package:parking_space/Providers/delete_slot_provider.dart';
import 'package:parking_space/Providers/register_parking_provider.dart';
import 'package:parking_space/Providers/register_space_provider.dart';
import 'package:parking_space/constant/app_colors.dart';
import 'package:parking_space/presentation/book_slot.dart';
import 'package:parking_space/presentation/delete_slot.dart';
import 'package:parking_space/presentation/home.dart';
import 'package:parking_space/presentation/register_space.dart';
import 'package:provider/provider.dart';
import 'presentation/all_registered_space.dart';


Future<void> main() async {
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
          '/RegisterSpace': (context) => ChangeNotifierProvider<RegisterParkingProvider>(create: (_) => RegisterParkingProvider(),child: const RegisterSpace()),
          '/BookSlot':(context) => ChangeNotifierProvider<BookSlotProvider>(create: (_) => BookSlotProvider(),child: const BookSlot()),
          '/DeleteSlot':(context) =>  ChangeNotifierProvider<DeleteSlotProvider>(create: (_) => DeleteSlotProvider(),child: const DeleteBookedSlot()),
          '/AllRegisteredSpace': (context) =>  ChangeNotifierProvider<RegisterSpaceProvider>(create: (_) => RegisterSpaceProvider(),child: AllRegisteredSpace(context: context,)),

        },
        theme: ThemeData(
            backgroundColor: AppColors.white,
            bottomAppBarColor: AppColors.black,
            appBarTheme: const AppBarTheme(color: AppColors.black,)
        ),
      );
  }
}
