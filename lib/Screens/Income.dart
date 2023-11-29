import 'package:finance_tracker/AppColors.dart';
import 'package:flutter/material.dart';
import '../API/ForexAPI.dart';
import 'Widgets.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {

  void clearText() {
    c1.clear();
    c2.clear();
    c3.clear();
  }

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          children: [
            MaterialTextField(
              isPassword: false,
              controller: c1,
              labelText: "Source",
              marginTop: 10,
              marginBottom: 10,
              width: 500,
              isReadOnly: false,
            ),
            MaterialTextField(
              isPassword: false,
              controller: c2,
              labelText: "Description",
              marginTop: 10,
              marginBottom: 10,
              width: 500,
              isReadOnly: false,
              isMultiline: true,
            ),
            MaterialTextField(
              isPassword: false,
              controller: c2,
              labelText: "Amount",
              marginTop: 10,
              marginBottom: 10,
              width: 500,
              isReadOnly: false,
              isMultiline: false,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: ()async{

                  var v = await ForexAPI.getForexRate("USD", "PKR");
                  print("api  $v");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                ),
                child: Center(
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
}
