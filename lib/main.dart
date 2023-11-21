import 'package:flutter/material.dart';
import 'Screens/Screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // color variables
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF2EDDB3),
          secondary: Color(0xFFFF4A57),
          // surface: Color(0xFF2EDDB3),
          // background: Color(0xFF2EDDB3),
          // error: Color(0xFF2EDDB3),
          // onPrimary: Color(0xFF2EDDB3),
          // onSecondary: Color(0xFF2EDDB3),
          // onSurface: Color(0xFF2EDDB3),
          // onBackground: Color(0xFF2EDDB3),
          // onError: Color(0xFF2EDDB3),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => Authentication(title: 'Authentication'),
        if (firstTime()) '/': (context) => Authentication(title: 'Enter New Pin'),
        if (!firstTime()) '/': (context) => Authentication(title: 'Enter Your Pin'),
        '/api': (context) => API(),
      }
    );
  }
}

bool firstTime(){
  return true;
}
