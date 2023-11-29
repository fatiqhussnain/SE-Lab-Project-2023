import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/AppColors.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: themeColor(),
        title: const Text('Settings', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: backgroundColor(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                  ),
                  child: Switch(
                      activeTrackColor: Colors.black87,
                      value: darkMode,
                      onChanged: (value)async{
                        setState(()  {
                          darkMode = value;
                        });

                        var cache = await SharedPreferences.getInstance();
                        cache.setBool('darkMode', darkMode);
                      }
                  ),
                ),
                title: Text(
                    'Dark Mode',
                    style: TextStyle(
                      color: textColor(),
                      fontSize: 18,
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
