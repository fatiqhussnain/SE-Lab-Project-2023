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

  final List<String> items = ['Select Type','Income', 'Loan'];
  String selectedValue = 'Select Type';

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
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
              marginBottom: 20,
              width: 500,
              isReadOnly: false,
              isMultiline: false,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.black87,
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
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: ()async{

                  // var v = await ForexAPI.getForexRate("USD", "PKR");
                  // print("api  $v");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
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
