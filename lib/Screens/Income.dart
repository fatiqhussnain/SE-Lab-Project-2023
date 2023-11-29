import 'package:finance_tracker/AppColors.dart';
import 'package:finance_tracker/Models/Models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../API/ForexAPI.dart';
import '../AppColors.dart';
import '../CRUD/CRUD.dart';
import '../Models/Models.dart';
import 'Widgets.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {

  late SharedPreferences cache;

  @override
  void initState() {
    super.initState();
    getCache();
  }

  Future<void> getCache() async {
    cache = await SharedPreferences.getInstance();
  }


  void clearText() {
    c1.clear();
    c2.clear();
    c3.clear();
  }

  final List<String> items = ['Select Type','Income', 'Loan'];
  String selectedValue = 'Select Type';

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialTextField(
              isPassword: false,
              controller: c1,
              tColor: textColor(),
              labelText: "Source",
              marginTop: 10,
              marginBottom: 10,
              width: 500,
              isReadOnly: false,
            ),
            MaterialTextField(
              isPassword: false,
              controller: c2,
              tColor: textColor(),
              labelText: "Description",
              marginTop: 10,
              marginBottom: 10,
              width: 500,
              isReadOnly: false,
              isMultiline: true,
            ),
            MaterialTextField(
              isPassword: false,
              controller: c3,
              labelText: "Amount",
              tColor: textColor(),
              marginTop: 10,
              marginBottom: 20,
              width: 500,
              isReadOnly: false,
              isMultiline: false,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: textColor(),
                  width: 1,
                ),
              ),

              child: DropdownButton<String>(
                underline: const SizedBox(),
                itemHeight: 50,
                borderRadius: BorderRadius.circular(20),
                isExpanded: true,
                value: selectedValue,
                onChanged: (String? newValue) {
                  // Handle when an item is selected
                  // Typically, you would use setState to update the UI
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            color: textColor(),
                          )
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: ()async{
                  submit(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor(),
                ),
                child: const Center(
                  child: Text(
                      "Submit",
                      style: TextStyle(
                        height: 2,
                        fontSize: 20,
                        color: Colors.white,
                      )
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> submit(BuildContext context)async{
    String source = c1.text;
    String description = c2.text;
    String amount = c3.text;
    String type = selectedValue;
    if(source.isEmpty || description.isEmpty || amount.isEmpty || type == 'Select Type'){
      showMessage(context, "Error!", "Please fill all the fields");
    }
    else if(isNumeric(amount) == false){
      showMessage(context, "Error!", "Invalid Amount!");
    }
    else{
      try{
        if(type == 'Income'){
          var transaction = TransactionBL(
            description: description,
            amount: double.parse(amount),
            type: -1,
            direction: 1,
            label: source,
            active: 1,
            createdAt: DateTime.now().toString(),
          );
          await TransactionCRUD.addTransaction(transaction);
        }
        else if(type == 'Loan'){
          var transfer = Transfer(
            description: description,
            amount: double.parse(amount),
            direction: 1,
            active: 1,
            createdAt: DateTime.now().toString(),
            name: source,
          );
        }
      }
      catch(e) {
        showMessage(context, "Error!", e.toString());
        return;
      }
      double balance = cache.getDouble("balance") !;
      balance += double.parse(amount);
      cache.setDouble("balance", balance);
      showMessage(context, "Success!", "Transaction added successfully!");
      clearText();
    }
  }
  Future<void> showMessage(BuildContext context, String head, String error)async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(head),
            content: Text(error),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK", style: TextStyle(color: themeColor()),),
              ),
            ],
          );
        }
    );
  }
  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    if(double.tryParse(s) == null) {
      return false;
    }
    return double.tryParse(s)! > 0;
  }
}
