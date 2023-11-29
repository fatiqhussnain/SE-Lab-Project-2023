import 'package:http/http.dart';

class ForexAPI {
  static Future<String> getForexRate(String from, String to) async {
    String url = "https://openexchangerates.org/api/latest.json?app_id=7ae97f97079c42a7bb9e5381aa48c2fb&base=${from}&callback=someCallbackFunction";
    Response response = await get(Uri.parse(url));
    return response.body;
  }
}