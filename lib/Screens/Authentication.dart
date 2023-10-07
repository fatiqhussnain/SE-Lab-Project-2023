import 'package:flutter/material.dart';

var lst = [
  Icon(Icons.edit_attributes, color: Colors.white,),
  Icon(Icons.edit_attributes, color: Colors.white,),
  Icon(Icons.edit_attributes, color: Colors.white,),
  Icon(Icons.edit_attributes, color: Colors.white,),
  Icon(Icons.edit_attributes, color: Colors.white,),
  Icon(Icons.edit_attributes, color: Colors.white,),
];

var circle = const Icon(Icons.circle, color: Colors.white,);
var slide = const Icon(Icons.edit_attributes, color: Colors.white,);

class Authentication extends StatefulWidget {
  Authentication({super.key, required this.title});
  late String title;
  @override
  State<Authentication> createState() => _AuthenticationState();
}
class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
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

            Expanded(
              flex: 1,
              child: Text(
                  widget.title!,
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
                      onPressed: (){},
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
                    onPressed: (){},
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
                    onPressed: (){},
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
                    onPressed: (){},
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
                    onPressed: (){},
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
                    onPressed: (){},
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
                    onPressed: (){},
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
                    onPressed: (){},
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
                    onPressed: (){},
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
                      print('backspace');
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
}
