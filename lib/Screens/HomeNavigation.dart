import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}


class _HomeNavigationState extends State<HomeNavigation> {

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          drawer: Drawer(
            width: width * 0.75,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                CircleAvatar(
                  radius: height * 0.07,
                  child: FlutterLogo(),
                ),
                Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: height * 0.02,
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                ),

                ListTile(
                  title: const Text('Currency Conversions'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                // add a line break
                const Divider(
                  height: 1,
                  thickness: 0.3,
                  indent: 12,
                  endIndent: 12,
                ),
                ListTile(
                  title: const Text('Setting'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Row(
              children: [
                Text('Home Navigation'),
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'Settings'),
                Tab(text: 'Profile'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Home')),
              Center(child: Text('Settings')),
              Center(child: Text('Profile')),
            ],
          ),
        ),
    );
  }
}
