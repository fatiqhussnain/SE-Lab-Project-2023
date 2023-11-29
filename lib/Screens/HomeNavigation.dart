import 'package:finance_tracker/Screens/Expense.dart';
import 'package:finance_tracker/Screens/Home.dart';
import 'package:finance_tracker/Screens/Income.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracker/CRUD/SqlHelper.dart';
import '/AppColors.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}


class _HomeNavigationState extends State<HomeNavigation> {

  @override
  void initState() {
    super.initState();
    SqlHelper.deleteMyDatabase();
    SqlHelper.db();
  }

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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: CircleAvatar(
                    radius: height * 0.07,
                    child: FlutterLogo(),
                  ),
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
                    Navigator.pushNamed(context, '/currencyConversion');
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
                    Navigator.pushNamed(context, '/setting');
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: themeColor,
            toolbarHeight: height * 0.08,
            elevation: 9,
            title: Text('CASHFLO', style: TextStyle(color: Colors.white),),
            bottom: const TabBar(
              unselectedLabelColor: Colors.white54,
              labelColor: Colors.white,
              tabs: [
                Tab(text: 'Income', height: 28,),
                Tab(text: 'Home', height: 28,),
                Tab(text: 'Expense', height: 28),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Income()),
              Center(child: Home()),
              Center(child: Expense()),
            ],
          ),
        ),
    );
  }
}
