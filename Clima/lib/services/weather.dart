import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class WeatherClass {
  getWeather(String uri) async {
    try {
      http.Response response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log('Error (${response.statusCode}) ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      throw ('Exception $e');
    }
  }
}
