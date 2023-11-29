import 'package:finance_tracker/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'Screens/Screens.dart';

void main() async{
  sqfliteFfiInit();
  // Set the ffi database factory before opening the database
  databaseFactory = databaseFactoryFfi;

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  darkMode = prefs.getBool('darkMode') ?? false;
  runApp(MyApp(cache: prefs));
}

class MyApp extends StatelessWidget {
  final cache ;

  MyApp({super.key, this.cache});

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
        if (isfirstTime()) '/': (context) => Authentication(title: 'Enter New Pin'),
        if (!isfirstTime()) '/': (context) => Authentication(title: 'Authentication'),
        '/homeNavigation': (context) => HomeNavigation(),
        '/currencyConversion': (context) => CurrencyConversion(),
        '/profile': (context) => Profile(),
        '/setting': (context) => Setting(),
        '/notifications': (context) => NotificationScreen(),
      }
    );
  }

  bool isfirstTime(){
    if(cache.getDouble('balance')==null){
      return true;
    }
    return false;
  }

}

