import 'package:finance_tracker/AppColors.dart';
import 'package:flutter/material.dart';

class CurrencyConversion extends StatefulWidget {
  const CurrencyConversion({super.key});

  @override
  State<CurrencyConversion> createState() => _CurrencyConversionState();
}

class _CurrencyConversionState extends State<CurrencyConversion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: themeColor,
        title: const Text('Currency Conversion', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Currency Conversion',
            ),
          ],
        ),
      ),
    );
  }
}
