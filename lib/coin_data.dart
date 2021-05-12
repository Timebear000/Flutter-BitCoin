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
const String coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const String apiKey = 'E2AFF053-8EBA-4572-8523-0EABFE6CEBA8';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      Uri request = Uri.parse('${coinAPIURL}/${crypto}/${selectedCurrency}');
      http.Response response = await http.get(request,
          headers: {"X-CoinAPI-Key": "E2AFF053-8EBA-4572-8523-0EABFE6CEBA8"});
      if (response.statusCode == 200) {
        print(response.body);
        var decodeData = jsonDecode(response.body);
        var lastPrice = decodeData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
