import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const String apikey = '1A3B8172-E45D-48A0-8CCB-8F5DEF3ADA02';
const uri = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<Map<String, String>> loadBtcTracker(String currency) async {
    Map<String, String> result = {};

    for (String crypto in cryptoList) {
      print('** Hello **');
      http.Response response =
          await http.get(Uri.parse('$uri/$crypto/$currency?apikey=$apikey'));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        result[crypto] =
            double.parse(decodedData['rate'].toString()).toStringAsFixed(0);
      } else {
        throw ('${response.statusCode} --> ${response.reasonPhrase} --> ${response.request!.url}');
      }
    }
    return result;
  }
}
