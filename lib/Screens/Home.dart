import 'package:finance_tracker/CRUD/CRUD.dart';
import 'package:flutter/material.dart';
import '../AppColors.dart';
import '../Models/Transaction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
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
                          color: thirteenthColor
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          'Rs. 1200000',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                    "Transactions",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87
                    ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    // var transaction = TransactionBL(
                    //   amount: 1000,
                    //   label: "Food",
                    //   description: "Biryani",
                    //   type: "Expense",
                    //   direction: 1,
                    //   createdAt: DateTime.now().toString(),
                    //   active: 1,
                    // );
                    // TransactionCRUD.addTransaction(transaction);
                    print(await TransactionCRUD.getTransactions());
                  },
                  child: Text('Add Transaction',style: TextStyle(color: themeColor),)
              ),
            ]
          ),
        ),
      ),
    );
  }
}
