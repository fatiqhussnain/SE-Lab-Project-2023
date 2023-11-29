import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'Screens/Screens.dart';

void main() {
  sqfliteFfiInit();
  // Set the ffi database factory before opening the database
  databaseFactory = databaseFactoryFfi;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // color variables
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFFFFFF),
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => Authentication(title: 'Authentication'),
        // if (firstTime()) '/': (context) => Authentication(title: 'Enter New Pin'),
        // if (!firstTime()) '/': (context) => Authentication(title: 'Enter Your Pin'),
        '/homeNavigation': (context) => HomeNavigation(),
        '/currencyConversion': (context) => CurrencyConversion(),
        '/profile': (context) => Profile(),
        '/setting': (context) => Setting(),
        '/notifications': (context) => NotificationScreen(),
      }
    );
  }
}

bool firstTime(){
  return true;
}
