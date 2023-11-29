import 'package:finance_tracker/Screens/Expense.dart';
import 'package:finance_tracker/Screens/Home.dart';
import 'package:finance_tracker/Screens/Income.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracker/CRUD/CRUD.dart';
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
                  child: Container(

                    decoration: BoxDecoration(

                      shape: BoxShape.circle,
                      border: Border.all(
                        color: themeColor,
                        width: 2,
                      ),
                    ),
                    height: height * 0.15,
                    child: ClipOval(
                      child: Image.network(
                          "https://media.licdn.com/dms/image/D4D03AQEXiNUbenr5DA/profile-displayphoto-shrink_200_200/0/1665739293673?e=2147483647&v=beta&t=IUnOsN5vcuM6Jrrnv8ZWLRu7l_xt_3zz9RVsjryxvAw",
                      ),
                    ),
                  ),
                ),
                Text(
                  'Muhammad Faraz Ali',
                  style: TextStyle(
                    fontSize: height * 0.02,
                  ),
                ),
                const Divider(
                  color: themeColor,
                  height: 20,
                  thickness: 1.5,
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CASHFLO', style: TextStyle(color: Colors.white),),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
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
