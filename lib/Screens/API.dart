import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              print(apiCall('3520146746171'));
            },
          child: null,
        )
      ),
    );
  }
}

dynamic apiCall(String CNIC)async{
  dynamic d = Uri.parse('https://mobilinkit.com/getdata?cnic=$CNIC');
  dynamic headers = {
    "Authorization" : "Bearer ANDREW_TATE!!"
  };
  dynamic response = await http.get(d, headers: headers);
  return response;
}
