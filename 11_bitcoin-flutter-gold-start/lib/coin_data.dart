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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '536A4038-3D9F-45B3-9519-F505F1D3D094';

class CoinData {
  Future<Map<String, String>> getCoinData(String selectedCurrency) async {
    Map<String, String> mapLastValues = {};
    print("cryptoList ${cryptoList.toString()}");
    for (String criptCurrency in cryptoList) {
      String requestURL =
          '$coinAPIURL/$criptCurrency/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);

      print("response : $criptCurrency : ${response.statusCode}");
      print("jsonDecode : $criptCurrency : ${jsonDecode(response.body)}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        mapLastValues[criptCurrency] = decodedData['rate'].toStringAsFixed(2);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    print(mapLastValues.toString());
    return mapLastValues;
  }

  getData() {}
}
