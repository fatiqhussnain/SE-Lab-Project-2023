import 'package:finance_tracker/AppColors.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Notifications"),
      ),
    );
  }
}
