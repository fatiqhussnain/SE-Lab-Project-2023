import 'package:flutter/material.dart';

import '../AppColors.dart';
import 'Widgets.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();

  final List<String> items = ['Select Type','Expense', 'Lending'];
  String selectedValue = 'Select Type';


  final List<String> categories = ['Select Category','Food', 'Education', 'Transportation', 'Entertainment', 'Health', 'Others'];
  String selectedCategory = 'Select Category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            MaterialTextField(
              isPassword: false,
              controller: c1,
              labelText: "Label",
              marginTop: 10,
              marginBottom: 10,
              width: 500,
              isReadOnly: false,
              tColor: textColor(),
            ),
            MaterialTextField(
              tColor: textColor(),
              isPassword: false,
              controller: c2,
              labelText: "Description",
              marginTop: 10,
              marginBottom: 10,
              width: 500,
              isReadOnly: false,
              isMultiline: true,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                value: selectedCategory,
                onChanged: (String? newValue) {
                  // Handle when an item is selected
                  // Typically, you would use setState to update the UI
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                          )
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            MaterialTextField(
              isPassword: false,
              controller: c2,
              labelText: "Amount",
              marginTop: 10,
              marginBottom: 20,
              tColor: textColor(),
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
              height: 25,
            ),


            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: themeRed,
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
}
