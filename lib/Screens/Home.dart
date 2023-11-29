import 'package:finance_tracker/CRUD/CRUD.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../AppColors.dart';
import '../Models/Transaction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences cache;
  late String balance;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getCache() async {
    cache = await SharedPreferences.getInstance();
    balance = (cache.getDouble('balance') ?? 0).toString();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder<void>(
      future: getCache(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: backgroundColor(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.2,
                      width: width,
                      child: Card(
                        color: themeBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total Balance',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: thirteenthColor),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'Rs. ${balance ?? 0}',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: textColor(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // print(await TransactionCRUD.getTransactions());
                        //del db
                        await SqlHelper.deleteMyDatabase();
                      },
                      child:  Text(
                        'Add Transaction',
                        style: TextStyle(color: themeColor()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          // Display a loading indicator while waiting for SharedPreferences
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
