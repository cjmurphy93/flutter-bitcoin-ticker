import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'keys.dart';

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

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      Uri url = Uri.https(
        'rest.coinapi.io',
        'v1/exchangerate/$crypto/$selectedCurrency',
        {
          'apikey': kApiKey,
        },
      );

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        String data = response.body;

        var decodedData = convert.jsonDecode(data);
        double rate = decodedData['rate'];
        cryptoPrices[crypto] = rate.toStringAsFixed(2);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoPrices;
  }
}
