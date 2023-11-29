import 'package:finance_tracker/CRUD/CRUD.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/AppColors.dart';
import 'package:flutter/material.dart';

import 'HomeNavigation.dart';

var lst = [
  const Icon(Icons.edit_attributes, color: Colors.white54,),
  const Icon(Icons.edit_attributes, color: Colors.white54,),
  const Icon(Icons.edit_attributes, color: Colors.white54,),
  const Icon(Icons.edit_attributes, color: Colors.white54,),
  const Icon(Icons.edit_attributes, color: Colors.white54,),
  const Icon(Icons.edit_attributes, color: Colors.white54,),
];

var circle = const Icon(Icons.circle, color: Colors.white,);
var slide = const Icon(Icons.edit_attributes, color: Colors.white54,);
int digits = 0;
int pin = 0;

// int height = MediaQuery.




class Authentication extends StatefulWidget {
  Authentication({super.key, required this.title});
  final String title;
  @override
  State<Authentication> createState() => _AuthenticationState(title);
}

class _AuthenticationState extends State<Authentication> {
  late var cache;
  Future<void> getCache() async {
    cache = await SharedPreferences.getInstance();
  }
  _AuthenticationState(this.title);
  final String title;

  @override
  void initState() {
    super.initState();
    getCache();
  }

  void buttonPress(int n, BuildContext context)async{
    if(digits<6) {
      lst[digits] = circle;
      digits++;
      pin = (pin * 10) + n;
      if(digits==6){
        if(title == "Authentication"){
          if(pin == cache.getInt('pin')){
            Navigator.pushReplacementNamed(context, '/homeNavigation');
          }
          else{
            pin = 0;
            digits = 0;
            for(int i=0; i<6; i++){
              lst[i] = slide;
            }
            showMessage(context, "Error", "Pin does not match");
          }
        }
        else if(title == "Enter New Pin"){
          cache.setInt('temp_pin', pin);
          pin = 0;
          digits = 0;
          for(int i=0; i<6; i++){
            lst[i] = slide;
          }
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>
                  Authentication(title: "Confirm Pin",))
          );
        }
        else if(title == "Confirm Pin"){
          if(pin == cache.getInt('temp_pin')){
            cache.setInt('pin', pin);
            cache.setDouble('balance', 0.0);
            cache.setBool("darkMode", false);
            SqlHelper.createTables(await SqlHelper.db());
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeNavigation(),));
          }
          else{
            pin = 0;
            digits = 0;
            for(int i=0; i<6; i++){
              lst[i] = slide;
            }
            showMessage(context, "Error", "Pin does not match");
          }
        }
        else{
          print('error');
        }
      }
    }
    print('digits: ${digits}');
    print('pin : ${pin}');
  }
  void backspace(){
    if (digits>0){
      lst[digits-1] = slide;
      digits--;
      pin = pin~/10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: themeColor(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/Logo.png'),
                    width: 50,
                  ),
                  Text(
                      'CASHFLO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans',
                      ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lst[0],
                  lst[1],
                  lst[2],
                  lst[3],
                  lst[4],
                  lst[5],
                ],
              ),
            ),

            const SizedBox(height: 10,),
            Expanded(
              flex: 1,
              child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Sans',
                  ),
              ),
            ),
            // add a grid for keypad
            Expanded(
              flex: 26,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  TextButton(
                      onPressed: (){
                        setState(() {
                          buttonPress(1, context);
                        });
                      },
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Sans',
                        ),
                      ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        buttonPress(2, context);
                      });
                    },
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        buttonPress(3, context);
                      });
                    },
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        buttonPress(4, context);
                      });
                    },
                    child: const Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        buttonPress(5, context);
                      });
                    },
                    child: const Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        buttonPress(6, context);
                      });
                    },
                    child: const Text(
                      '6',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        buttonPress(7, context);
                      });
                    },
                    child: const Text(
                      '7',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        buttonPress(8, context);
                      });
                    },
                    child: const Text(
                      '8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        buttonPress(9, context);
                      });
                    },
                    child: const Text(
                      '9',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: const Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        buttonPress(0, context);
                      });
                    },
                    child: const Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Sans',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        backspace();
                      });
                    },
                    child: const Icon(
                        Icons.backspace_outlined,
                        color: Colors.white,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
}
